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

with open('figures-to-redo.txt','r') as inputfile:
    lines = inputfile.readlines()

tex_command = ['latexmk', '-pdf', '-pdflatex=lualatex', '-silent', '']

lines = [line.strip() for line in lines]
for line in lines:
    if line.startswith('#'):
        continue
    l = line.split('/')[1]
    with cd(line):
        print(line,os.path.isfile(l + '.tex'))
        tex_command[-1:] = [l]
        call(tex_command)
        shutil.copyfile(l + '.pdf', '../' + l + '.pdf')
        print('')

dirs = [
    '03-Butanol/buoh-isomers',
    '04-Pentanol/ipeoh-skeletal',
    '05-MCH/mch-model-1',
    '05-MCH/mch-model-2',
    '05-MCH/mch-model-3',
    '05-MCH/mch-pressure',
]
with cd(dirs[0]):
    tex_command[-1:] = ['nbuoh-skeletal']
    call(tex_command)
    shutil.copyfile('nbuoh-skeletal.pdf','../nbuoh-skeletal.pdf')

    tex_command[-1:] = ['sbuoh-skeletal']
    call(tex_command)
    shutil.copyfile('sbuoh-skeletal.pdf','../sbuoh-skeletal.pdf')

    tex_command[-1:] = ['tbuoh-skeletal']
    call(tex_command)
    shutil.copyfile('tbuoh-skeletal.pdf','../tbuoh-skeletal.pdf')

    tex_command[-1:] = ['ibuoh-skeletal']
    call(tex_command)
    shutil.copyfile('ibuoh-skeletal.pdf','../ibuoh-skeletal.pdf')

with cd(dirs[1]):
    tex_command[-1:] = ['ipeoh-skeletal']
    call(tex_command)
    shutil.copyfile('ipeoh-skeletal.pdf','../ipeoh-skeletal.pdf')

for dir in dirs[2:4]:
    l = dir.split('/')[1]
    with cd(dir):
        tex_command[-1:] = [l + '-first']
        call(tex_command)
        tex_command[-1:] = [l + '-over']
        call(tex_command)
        shutil.copyfile(l + '-first.pdf', '../' + l + '-first.pdf')
        shutil.copyfile(l + '-over.pdf', '../' + l + '-over.pdf')

with cd(dirs[5]):
    tex_command[-1:] = ['mch-pressure-1']
    call(tex_command)
    tex_command[-1:] = ['mch-pressure-2']
    call(tex_command)
    tex_command[-1:] = ['mch-pressure-3']
    call(tex_command)
    shutil.copyfile('mch-pressure-1.pdf', '../mch-pressure-1.pdf')
    shutil.copyfile('mch-pressure-2.pdf', '../mch-pressure-2.pdf')
    shutil.copyfile('mch-pressure-3.pdf', '../mch-pressure-3.pdf')
