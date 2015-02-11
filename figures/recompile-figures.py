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

tex_command = ['latexmk', '-lualatex', '-silent']

lines = [line.strip() for line in lines]
for line in lines:
    if line.startswith('#'):
        continue
    l = line.split('/')[1]
    with cd(line):
        print(line,os.path.isfile(l + '.tex'))
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
    call(tex_command)
    for spec in ['nbuoh', 'sbuoh', 'tbuoh', 'ibuoh']:
        shutil.copyfile('{}-skeletal.pdf'.format(spec),'../{}-skeletal.pdf'.format(spec))

with cd(dirs[1]):
    call(tex_command)
    shutil.copyfile('ipeoh-skeletal.pdf','../ipeoh-skeletal.pdf')

for dir in dirs[2:5]:
    l = dir.split('/')[1]
    with cd(dir):
        call(tex_command)
        shutil.copyfile(l + '-first.pdf', '../' + l + '-first.pdf')
        shutil.copyfile(l + '-over.pdf', '../' + l + '-over.pdf')

with cd(dirs[5]):
    call(tex_command)
    for num in ['1', '2', '3']:
        shutil.copyfile('mch-pressure-{}.pdf'.format(num), '../mch-pressure-{}.pdf'.format(num))
