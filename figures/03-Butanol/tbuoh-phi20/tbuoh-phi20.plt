reset
set term postscript enhanced eps font "Times,18" color size 9cm,7cm dl 2.0
set output "tbuoh-phi20.eps"
set yrange[18:45]
set xrange [-10:120]
set xlabel "Time, ms"
set ylabel "Pressure, bar" offset 2
set title "{/=24 {/Times-Italic t}-Butanol/O_{2}/N_{2}, {/Times-Italic P_{/*0.75 C}}=30 bar, {/Symbol f}=2.0}"
unset key
set mxtics 4
set mytics 5
set xtics scale 1.25,0.75 
set ytics scale 1.25,0.75
set bmargin 3.5
set datafile separator ","

set label at 10,21 "{/=16 O_{2} : N_{2} = 1 : 3.76}"
set label at 107,35 rotate by 90 tc rgb "#000000" "{/=14 {/Times-Italic T_{C}} = 714 K}"
set label at 53,37 rotate by 90 tc rgb "#FF0000" "{/=14 739 K}"
set label at 28,37 rotate by 90 tc rgb "#006400" "{/=14 764 K}"
set label at 17,37 rotate by 90 tc rgb "#0000FF" "{/=14 784 K}"
set label at 9,37 rotate by 90 tc rgb "#FF00FF" "{/=14 810 K}"
set label at 80,21 right tc rgb "#666699" "{/=14 Non-Reactive}"

set arrow from 80,21 to 90,23.1 filled size 0.01,15 lc rgb "#666699" lw 1.5

plot 'tbuoh-phi20.txt' u 1:2 w lines lt 1 lw 1.5 lc rgb "#000000",\
     'tbuoh-phi20.txt' u 3:4 every ::::9500 w lines lt 1 lw 1.5 lc rgb "#FF0000",\
     'tbuoh-phi20.txt' u 5:6 every ::::7000 w lines lt 1 lw 1.5 lc rgb "#006400",\
     'tbuoh-phi20.txt' u 7:8 every ::::6000 w lines lt 1 lw 1.5 lc rgb "#0000FF",\
     'tbuoh-phi20.txt' u 9:10 every ::::5000 w lines lt 1 lw 1.5 lc rgb "#FF00FF",\
     'tbuoh-phi20.txt' u 11:12 w lines lt 1 lw 1.5 lc rgb "#666699"

set output