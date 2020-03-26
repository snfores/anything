#https://www.instructables.com/id/Create-a-Simple-Python-Text-Editor/
import sys
python_version = sys.version

def text_save():
    global text
    write_text = text.get("1.0", "end-1c")
    savelocation = tkinter.filedialog.asksaveasfilename()
    file1 = open(savelocation, "w+")
    file1.write(write_text)
    file1.close()
def font_helvetica():
    global text
    text.config(font = "Helvetica")
def font_courier():
    global text
    text.config(font = "Courier")

if "2.7" in python_version:
    from Tkinter import *
    import tkFileDialog
    editor_title = "text editor Python2"


elif "3." in python_version: #("3.3" in python_version or "3.4" in python_version:)and more
    from tkinter import *
    import tkinter.filedialog
    editor_title = "text editor Python3"

try:
    root = Tk("Text Editor")
    text = Text(root)
    text.grid()
    save_button = Button(root, text = "Save", command = text_save)
    save_button.grid()
    font = Menubutton(root, text = "Font")
    font.grid()
    font.menu = Menu(font, tearoff = 0)
    font["menu"] = font.menu
    Helvetica = IntVar()
    arial = IntVar()
    times = IntVar()
    Courier = IntVar()
    font.menu.add_checkbutton(label="Courier", variable=Courier, command=font_courier)
    font.menu.add_checkbutton(label="Helvetica", variable=Helvetica,command=font_helvetica)
    root.mainloop()
except:
    print(python_version)
