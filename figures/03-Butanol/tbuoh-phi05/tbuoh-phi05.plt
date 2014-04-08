reset
set term postscript enhanced eps font "Times,18" color size 9cm,7cm dl 2.0
set output "tbuoh-phi05.eps"
set yrange[18:45]
set xrange [-10:140]
set xlabel "Time, ms"
set ylabel "Pressure, bar" offset 2
set title "{/=24 {/Times-Italic t}-Butanol/O_{2}/N_{2}, {/Times-Italic P_{/*0.75 C}}=30 bar, {/Symbol f}=0.5}"
unset key
set mxtics 4
set mytics 5
set xtics scale 1.25,0.75 
set ytics scale 1.25,0.75
set bmargin 3.5
set datafile separator ","

set label at 10,21 "{/=16 O_{2} : N_{2} = 1 : 3.76}"
set label at 125,35 rotate by 90 tc rgb "#000000" "{/=14 {/Times-Italic T_{C}} = 792 K}"
set label at 55,37 rotate by 90 tc rgb "#FF0000" "{/=14 823 K}"
set label at 29,37 rotate by 90 tc rgb "#006400" "{/=14 860 K}"
set label at 15,37 rotate by 90 tc rgb "#0000FF" "{/=14 897 K}"
set label at 6.5,37 rotate by 90 tc rgb "#FF00FF" "{/=14 912 K}"
set label at 90,23 right tc rgb "#666699" "{/=14 Non-Reactive}"

set arrow from 90,23 to 100,24.2 filled size 0.01,15 lc rgb "#666699" lw 1.5

plot 'tbuoh-phi05.txt' u 1:2 w lines lt 1 lw 1.5 lc rgb "#000000",\
     'tbuoh-phi05.txt' u 3:4 every ::::10000 w lines lt 1 lw 1.5 lc rgb "#FF0000",\
     'tbuoh-phi05.txt' u 5:6 every ::::6500 w lines lt 1 lw 1.5 lc rgb "#006400",\
     'tbuoh-phi05.txt' u 7:8 every ::::5000 w lines lt 1 lw 1.5 lc rgb "#0000FF",\
     'tbuoh-phi05.txt' u 9:10 every ::::4500 w lines lt 1 lw 1.5 lc rgb "#FF00FF",\
     'tbuoh-phi05.txt' u 11:12 w lines lt 1 lw 1.5 lc rgb "#666699"

set output