import tkinter as tk
from tkinter import messagebox
import psycopg2

DB_CONFIG = {
    "host": "localhost",
    "database": "postgres",
    "user": "postgres",
    "password": "J20082710j",
    "port": "5432"
}


def get_user_fio(login):
    conn = psycopg2.connect(**DB_CONFIG)
    try:
        with conn.cursor() as cur:
            cur.execute("SELECT second_name, first_name, middle_name FROM users WHERE login = %s;", (login,))
            row = cur.fetchone()
            if row:
                return f"{row[0] or ''} {row[1] or ''} {row[2]or ''}".strip
    except Exception as e:
        messagebox.showerror("Ошибка БД", str(e))
    finally:
        con.close()
    return None

def show_main_screen(user_fio):
    for w in root.winfo_children():
        w.destory()

    root.title("Главная страница")
    root.geometry("600x400")

    tk.Label(root, text=f"Добро пожаловать,\n{user_fio}!", font=("Arial", 18, "bold", pady=30).pack())
    tk.Label(root, text="")