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

tex_command = ['latexmk', '-pdf', '-pdflatex=lualatex', '-silent', '']
lines = [line.strip() for line in lines]
# print(lines)
for line in lines:
# line = lines[0]
    if line.startswith('#'):
        continue
    l = line.split('/')[1]
    with cd(line):
        print(line,os.path.isfile(l + '.tex'))
        tex_command[-1:] = [l]
        call(tex_command)
        shutil.copyfile(l + '.pdf', '../' + l + '.pdf')
        print('')
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
    call([tex_command,'nbuoh-skeletal'])
    call([tex_command,'nbuoh-skeletal'])
    shutil.copyfile('nbuoh-skeletal.pdf','../nbuoh-skeletal.pdf')

    call([tex_command,'sbuoh-skeletal'])
    call([tex_command,'sbuoh-skeletal'])
    shutil.copyfile('sbuoh-skeletal.pdf','../sbuoh-skeletal.pdf')

    call([tex_command,'tbuoh-skeletal'])
    call([tex_command,'tbuoh-skeletal'])
    shutil.copyfile('tbuoh-skeletal.pdf','../tbuoh-skeletal.pdf')

    call([tex_command,'ibuoh-skeletal'])
    call([tex_command,'ibuoh-skeletal'])
    shutil.copyfile('ibuoh-skeletal.pdf','../ibuoh-skeletal.pdf')

with cd(dirs[1]):
    call([tex_command,'ipeoh-skeletal'])
    call([tex_command,'ipeoh-skeletal'])
    shutil.copyfile('ipeoh-skeletal.pdf','../ipeoh-skeletal.pdf')

for dir in dirs[2:4]:
    l = dir.split('/')[1]
    with cd(dir):
        call([tex_command, l+'-first'])
        call([tex_command, l+'-over'])
        shutil.copyfile(l+'-first.pdf','../'+l+'-first.pdf')
        shutil.copyfile(l+'-over.pdf','../'+l+'-over.pdf')

with cd(dirs[5]):
    call([tex_command, 'mch-pressure-1'])
    call([tex_command, 'mch-pressure-2'])
    call([tex_command, 'mch-pressure-3'])
    shutil.copyfile('mch-pressure-1.pdf','../mch-pressure-1.pdf')
    shutil.copyfile('mch-pressure-2.pdf','../mch-pressure-2.pdf')
    shutil.copyfile('mch-pressure-3.pdf','../mch-pressure-3.pdf')
