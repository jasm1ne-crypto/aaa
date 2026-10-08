import tkinter as tk

from tkinter import ttk, messagebox

import psycopg2

DB_HOST = "localhost"
DB_NAME ="obuv_chudo"
DB_USER = "postgres"
DB_PASS = "J20082710j"
DB_PORT = "5432"

def fetch_users():
    try:
        conn = psycopg2.connect(
            host=DB_HOST,
            database=DB_NAME,
            user=DB_USER,
            password=DB_PASS,
            port=DB_PORT
        )

        cur = conn.cursor()

        cur.execute("""
            SELECT p.product_id, 
            p.models_name, 
            p.subcategory, 
            p.image, 
            p.description, 
            p.price, 
            p.sostav, 
            p.proizvodstvo, 
            c.name
            FROM products p
            LEFT JOIN categories c ON p.categories_id = c.categories_id
            ORDER BY p.product_id ASC;  
        """)

        rows = cur.fetchall()

        for item in tree.get_children():
            tree.delete(item)

        for row in rows:
            tree.insert('', 'end', values=row)

        cur.close()
        conn.close()

    except Exception as e:
        messagebox.showerror("Ошибка БД", str(e))



#интерфейс

window = tk.Tk()
window.title("Модель обуви")
window.geometry("800x400")

tk.Label(window, text="модель обуви", font=("Arial", 14, "bold")).pack(pady=10)
columns = ("product_id", "models_name", "subcategory", "image", "description", "price", "sostav", "proizvodstvo", "categories_id")
tree = ttk.Treeview(window, columns=columns, show="headings")
tree.heading("product_id", text="ID")
tree.heading("models_name", text="Наименование товара")
tree.heading("subcategory", text="Подкатегория")
tree.heading("image", text="Изображение")
tree.heading("description", text="Описание")
tree.heading("price", text="Цена")
tree.heading("sostav", text="Состав")
tree.heading("proizvodstvo", text="Производство")
tree.heading("categories_id", text="Категория")

tree.column("product_id", width=60, anchor="center")
tree.column("models_name", width=120)
tree.column("subcategory", width=120)
tree.column("image", width=120)
tree.column("description", width=120)
tree.column("price", width=120)
tree.column("sostav", width=120)
tree.column("proizvodstvo", width=120)
tree.column("categories_id", width=120)

tree.pack(fill="both", expand=True, padx=10, pady=5)

tk.Button(window, text="Обновить", command=fetch_users, font=("Arial", 14)).pack(pady=5)

fetch_users()
window.mainloop()