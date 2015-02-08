#! /usr/bin/python3
import os
from subprocess import call
import shutil

class cd:
    """Change directory.
    For use with the `with` keyword, i.e. `with cd(dir):` changes to the
    directory `dir` within the `with` construct
    """

    def __init__(self, newPath):
        """Set the newPath attribute to be the argument passed to the class."""
        self.newPath = newPath

    def __enter__(self):
        """Change directory when the class is entered."""
        self.savedPath = os.getcwd()
        os.chdir(self.newPath)

    def __exit__(self, etype, value, traceback):
        """Change back when the class is exited"""
        os.chdir(self.savedPath)

# w = os.walk('.')
# next(w)
# root,dirs,files = next(w)
# print(root, dirs)
# with open('figures-to-redo.txt','w') as out:
    # dirs = [name for name in os.listdir('.') if os.path.isdir(os.path.join('.',name))]
    # for dir in dirs:
        # d = [name for name in os.listdir(dir) if os.path.isdir(os.path.join(dir,name))]
        # for a in d:
            # out.write(os.path.join(dir,a)+'\n')

with open('figures-to-redo.txt','r') as inputfile:
    lines = inputfile.readlines()

lines = [line.strip() for line in lines]
# print(lines)
for line in lines:
# line = lines[0]
    l = line.split('/')[1]
    with cd(line):
        print(line,os.path.isfile(l+'.tex'))
        call(['lualatex', l])
        shutil.copyfile(l+'.pdf','../'+l+'.pdf')
# for dir in dirs:
    # with cd(dir):
dirs = [
    '03-Butanol/buoh-isomers',
    '04-Pentanol/ipeoh-skeletal',
    '05-MCH/mch-model-1',
    '05-MCH/mch-model-2',
    '05-MCH/mch-model-3',
    '05-MCH/mch-pressure',
]
with cd(dirs[0]):
    call(['lualatex','nbuoh-skeletal'])
    call(['lualatex','nbuoh-skeletal'])
    shutil.copyfile('nbuoh-skeletal.pdf','../nbuoh-skeletal.pdf')
    
    call(['lualatex','sbuoh-skeletal'])
    call(['lualatex','sbuoh-skeletal'])
    shutil.copyfile('sbuoh-skeletal.pdf','../sbuoh-skeletal.pdf')
    
    call(['lualatex','tbuoh-skeletal'])
    call(['lualatex','tbuoh-skeletal'])
    shutil.copyfile('tbuoh-skeletal.pdf','../tbuoh-skeletal.pdf')
    
    call(['lualatex','ibuoh-skeletal'])
    call(['lualatex','ibuoh-skeletal'])
    shutil.copyfile('ibuoh-skeletal.pdf','../ibuoh-skeletal.pdf')

with cd(dirs[1]):
    call(['lualatex','ipeoh-skeletal'])
    call(['lualatex','ipeoh-skeletal'])
    shutil.copyfile('ipeoh-skeletal.pdf','../ipeoh-skeletal.pdf')

for dir in dirs[2:4]:
    l = dir.split('/')[1]
    with cd(dir):
        call(['lualatex', l+'-first'])
        call(['lualatex', l+'-over'])
        shutil.copyfile(l+'-first.pdf','../'+l+'-first.pdf')
        shutil.copyfile(l+'-over.pdf','../'+l+'-over.pdf')

with cd(dirs[5]):
    call(['lualatex', 'mch-pressure-1'])
    call(['lualatex', 'mch-pressure-2'])
    call(['lualatex', 'mch-pressure-3'])
    shutil.copyfile('mch-pressure-1.pdf','../mch-pressure-1.pdf')
    shutil.copyfile('mch-pressure-2.pdf','../mch-pressure-2.pdf')
    shutil.copyfile('mch-pressure-3.pdf','../mch-pressure-3.pdf')
