from pathlib import Path
def check_and_make_dir(dirname):
    Path(dirname).mkdir(parents=True, exist_ok=True)

import re
def get_student_name(_filename):
    res = re.findall('[^a-zA-Z ]*([a-zA-Z ]*)\d*.*', _filename) 
    return str(res[0])

import shutil
def copy_and_rename(_dirname, _filename):
    filename_full = os.path.join(_dirname, _filename)
    folder_new = os.path.join(_dirname, "assignment_1")
    check_and_make_dir(folder_new)
    folder_new = os.path.join(folder_new, "class2_"+get_student_name(_filename))
    check_and_make_dir(folder_new)
    filename_full_new = os.path.join(folder_new, "sol1.sml")
    shutil.copy2(filename_full, filename_full_new)

import os

if __name__ == "__main__":
    dirname = os.getcwd()
    filenames = os.listdir(dirname)

    f = open("./registration_class1.txt", 'w')
    
    for filename in filenames:
        ext = os.path.splitext(filename)[-1]
        if ext == '.sml':
            print(filename)
            copy_and_rename(dirname, filename)
            data = get_student_name(filename) + "\n"
            f.write(data)
    f.close()