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
            SELECT u.user_id, u.first_name, u.name, u.last_name, u.login, r.role_name
            FROM users u
            LEFT JOIN roles r ON u.role_id = r.role_id
            ORDER BY u.user_id ASC;      
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


#Интерфейс
window = tk.Tk()
window.title("Пользователи")
window.geometry("800x400")

tk.Label(window, text="Список пользователей", font=("Arial", 14, "bold")).pack(pady=10)
columns = ("user_id", "first_name", "name", "last_name", "login", "role_name")
tree = ttk.Treeview(window, columns=columns, show="headings")
tree.heading("user_id", text="ID")
tree.heading("name", text="Фамилия")
tree.heading("first_name", text="Имя")
tree.heading("last_name", text="Отчество")
tree.heading("login", text="Логин")
tree.heading("role_name", text="Роль")

tree.column("user_id", width=60, anchor="center")
tree.column("first_name", width=120)
tree.column("name", width=120)
tree.column("last_name", width=120)
tree.column("login", width=130)
tree.column("role_name", width=130)

tree.pack(fill="both", expand=True, padx=10, pady=5)

tk.Button(window, text="Обновить", command=fetch_users, font=("Arial", 14)).pack(pady=5)

fetch_users()
window.mainloop()