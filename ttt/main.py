#импорт библиотек
import tkinter as tk
from tkinter import messagebox

#создание главного окна
window = tk.Tk()
window.title("мои заметки")
window.geometry("400x500")

#поле для ввода текста
entry = tk.Entry(window, font=("Arial", 14))
entry.pack(pady=10,padx=10, fill="x")

#список + прокрутка
list_frame = tk.Frame(window)
list_frame.pack(fill="both", expand=True, padx=10, pady=5)

scrollbar = tk.Scrollbar(list_frame)
scrollbar.pack(side="right",fill="y")

listbox = tk.Listbox(
    list_frame,
    font=("Arial", 12),
    yscrollcommand=scrollbar.set,
    selectmode="single"
)
listbox.pack(side="left", fill="both", expand=True)

scrollbar.config(command=listbox.yview)

#функция добавления заметки
def add_task():
    task = entry.get().strip()
    if task:
        listbox.insert(tk.END, task)
        entry.delet(0, tk.END)
        status_label.config(text=f"Добавлено: {task}")
    else:
        messagebox.showwarning("Пусто", "Введите текст заметки!")

#функция удаления заметки
def delete_task():
    try:
        selected = listbox.curselection()[0]
        listbox.delete(selected)
        status.label.config(text="Заметка удалена")
    except IndexError:
        messagebox.showwarning("Не выбрано", "Выберите заметку для удаления!")

#функция реакции на выбор элемента
def on_select(event):
    selected = listbox.curselection()
    if selected:
        item = listbox.get(selected[0])
        status_label.config(text=f"выбрано: {item}")

#кнопки управления
btn_frame = tk.Frame(window)
btn_frame.pack(pady=5)

add_btn = tk.Button(btn_frame, text="Добавить", command=add_task)
add_btn.pack(side="left", padx=5)

del_btn = tk.Button(btn_frame, text="Удалить", command=delete_task)
del_btn.pack(side="left", padx=5)

#статусная строка внизу
status_label = tk.Label(window, text="Готово", font=("Arial", 10), anchor="w")
status_label.pack(fill="x", padx=10, pady=5)

#верхнее меню
menubar = tk.Menu(window)
file_menu = tk.Menu(menubar, tearoff=0)
file_menu.add_command(label="Очистить все", command=lambda: listbox.delete(0, tk.END))
file_menu.add_separator()
file_menu.add_command(label="Выход", command=window.quit)
menubar.add_cascade(label="Файл", menu=file_menu)
window.config(menu=menubar)

#привязка событий
listbox.bind("<<ListboxSelect>>", on_select)
window.bind("<Return>", lambda event: add_task())

window.mainloop()