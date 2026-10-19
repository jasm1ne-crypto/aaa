import tkinter as tk  
from tkinter import messagebox  
import psycopg2  
from datetime import datetime, timedelta  
import os  # Модуль для работы с операционной системой (формирование путей к файлам)

DB_CONFIG = {
    "host": "localhost",
    "database": "obuv_chudo",
    "user": "postgres",
    "password": "J20082710j",
    "port": "5432"
}

#путь к файлу картинки-заглушки
PLACEHOLDER_IMAGE = os.path.join(os.path.dirname(__file__), "picture.png")


# Класс-обертка для работы с базой данных.
class DB:
    @staticmethod
    def _exec(query, params=None, fetch=False, commit=False):
        conn = psycopg2.connect(**DB_CONFIG)
        try:
            with conn.cursor() as cur:
                cur.execute(query, params or ())
                return cur.fetchall() if fetch else cur.fetchone()
        except Exception as e:
            conn.rollback()
            messagebox.showerror("Ошибка БД", str(e))
            return [] if fetch else None
        finally:
            conn.close()

    # Метод для проверки существования пользователя (авторизация).
    @staticmethod
    def authenticate(login):
       
        row = DB._exec(
            "SELECT u.user_id, u.first_name, u.middle_name, u.last_name, r.role_name "
            "FROM users u JOIN roles r ON u.role_id = r.role_id WHERE u.login = %s;",
            (login,), fetch=True)
        
        if row:
            r = row[0]
            return {'id': r[0], 'fio': f"{r[3] or ''} {r[1] or ''} {r[2] or ''}".strip(), 'role': r[4]}
        return None

    # Метод для получения списка всех моделей обуви из БД
    @staticmethod
    def get_models():
        
        rows = DB._exec(
            "SELECT product_id, category, subcategory, product_name, manufacturer, description, composition, price "
            "FROM products ORDER BY category, product_name;", fetch=True)
        
        return [(*r[:7], float(r[7])) for r in rows] if rows else []

    # Метод для подсчета общего количества доступного товара для конкретной модели
    @staticmethod
    def get_total_stock_qty(model_id):
    
        row = DB._exec(
            "SELECT COALESCE(SUM(quantity_available), 0) FROM stock_items WHERE product_id = %s;",
            (model_id,), fetch=True)
        return row[0][0] if row else 0

    # Метод проверяет, были ли заказы на данную модель в предыдущем календарном месяце.
    @staticmethod
    def had_orders_in_previous_month(model_id):
        now = datetime.now()
        first_day = now.replace(day=1, hour=0, minute=0, second=0, microsecond=0)
        first_day_prev = (first_day - timedelta(days=1)).replace(day=1)

    
        row = DB._exec(
            "SELECT COUNT(*) FROM order_items oi JOIN orders o ON oi.order_id = o.order_id "
            "WHERE oi.product_id = %s AND o.order_date >= %s AND o.order_date < %s;",
            (model_id, first_day_prev, first_day), fetch=True)
        
        return row[0][0] > 0 if row else False


# Функция для полной очистки главного окна приложения.
def clear_screen():
    for w in root.winfo_children():
        w.destroy()

# Функция отрисовки экрана авторизации (входа в систему)
def show_login_screen():
    clear_screen()
    root.title("Вход в систему")
    root.geometry("400x250")

    tk.Label(root, text="Авторизация", font=("Arial", 16, "bold")).pack(pady=20)
    tk.Label(root, text="Логин:", font=("Arial", 12)).pack()

    entry = tk.Entry(root, width=30, font=("Arial", 12))
    entry.pack(pady=10)

    def handle():
        login = entry.get().strip()
        if not login:
            messagebox.showwarning("Ошибка", "Введите логин!")
            return

        user = DB.authenticate(login)
        if not user:
            messagebox.showerror("Ошибка", "Пользователь не найден!")
            return

        user['login'] = login
        show_catalog(user)

    entry.bind('<Return>', lambda e: handle())

    tk.Button(root, text="Войти", command=handle, font=("Arial", 12), width=20).pack(pady=15)
    entry.focus()

# Функция отрисовки главного экрана с каталогом товаров
def show_catalog(user):
    clear_screen()
    root.title("Чудо-обувь")
    root.geometry("900x600")

    # --- ШАПКА ОКНА ---
    header = tk.Frame(root)
    header.pack(fill="x")

    tk.Label(header, text=f"Каталог | {user['fio']}", font=("Arial", 14, "bold"),
             padx=10, pady=10).pack(side="left")

    tk.Button(header, text="Выйти", command=show_login_screen,
              font=("Arial", 11)).pack(side="right", padx=5, pady=5)

    # --- ОБЛАСТЬ С ПРОКРУТКОЙ ДЛЯ КАТАЛОГА ---
    canvas_frame = tk.Frame(root)
    canvas_frame.pack(fill="both", expand=True, padx=10, pady=10)

    canvas = tk.Canvas(canvas_frame, bg="white")
    scrollbar = tk.Scrollbar(canvas_frame, orient="vertical", command=canvas.yview)

    scrollable = tk.Frame(canvas, bg="white")

    scrollable.bind("<Configure>", lambda e: canvas.configure(scrollregion=canvas.bbox("all")))
    canvas.create_window((0, 0), window=scrollable, anchor="nw")
    canvas.configure(yscrollcommand=scrollbar.set)

    canvas.pack(side="left", fill="both", expand=True)
    scrollbar.pack(side="right", fill="y")

    models = DB.get_models()
    if not models:
        tk.Label(scrollable, text="Товары не найдены", font=("Arial", 14)).pack(pady=50)
        return

    placeholder = None
    try:
        from PIL import Image, ImageTk
        if os.path.exists(PLACEHOLDER_IMAGE):
            img = Image.open(PLACEHOLDER_IMAGE).resize((120, 120), Image.LANCZOS)
            placeholder = ImageTk.PhotoImage(img)
    except ImportError:
        pass

    for m in models:
        model_id, category, _, name, manufacturer, description, composition, base_price = m

        total_qty = DB.get_total_stock_qty(model_id)
        had_orders = DB.had_orders_in_previous_month(model_id)

        display_price = base_price if had_orders else base_price * 0.75
        price_note = "" if had_orders else " (−25%)"
        price_color = "#CC0000" if total_qty <= 3 else "black"

        # --- ВЕРСТКА КАРТОЧКИ ТОВАРА ---
        card = tk.Frame(scrollable, relief="raised", bd=2, padx=10, pady=10, bg="white")
        card.pack(fill="x", padx=10, pady=8)

        top = tk.Frame(card, bg="white")
        top.pack(fill="x")

        left = tk.Frame(top, bg="white")
        left.pack(side="left", fill="x", expand=True)

        img_frame = tk.Frame(left, bg="white", width=120, height=120)
        img_frame.pack(side="left", padx=(0, 15))
        img_frame.pack_propagate(False)

        if placeholder:
            tk.Label(img_frame, image=placeholder, bg="white").pack()
        else:
            c = tk.Canvas(img_frame, width=120, height=120, bg="#DDD",
                          highlightbackground="#999", highlightthickness=1)
            c.pack()
            c.create_text(60, 60, text="Нет\nизображения", fill="#666", font=("Arial", 10))

        info = tk.Frame(left, bg="white")
        info.pack(side="left", fill="x", expand=True)

        tk.Label(info, text=f"Категория: {category}", font=("Arial", 10),
                 bg="white", anchor="w").pack(fill="x")
        tk.Label(info, text=f"Количество: {total_qty} шт.", font=("Arial", 10),
                 bg="white", anchor="w").pack(fill="x")
        if composition:
            tk.Label(info, text=f"Состав: {composition}", font=("Arial", 10),
                     bg="white", anchor="w", wraplength=400, justify="left").pack(fill="x")

        right = tk.Frame(top, bg="white")
        right.pack(side="right")

        tk.Label(right, text=f"{manufacturer or '-'} | {name}",
                 font=("Arial", 12, "bold"), bg="white", anchor="e").pack(fill="x", padx=(0, 10))
        tk.Label(right, text=f"Цена: {display_price:.2f} руб.{price_note}",
                 font=("Arial", 14, "bold"), bg="white",
                 fg=price_color).pack(fill="x", padx=(0, 10), pady=(5, 0))

        if description:
            tk.Label(card, text=description, font=("Arial", 10),
                     bg="white", anchor="w", wraplength=700, justify="left").pack(fill="x", pady=(5, 0))


# Точка входа в приложение
if __name__ == "__main__":
    root = tk.Tk()
    show_login_screen()
    root.mainloop()