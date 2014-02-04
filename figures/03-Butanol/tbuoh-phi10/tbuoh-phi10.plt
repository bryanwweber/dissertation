reset
set term postscript enhanced eps font "Times,18" color size 9cm,7cm dl 2.0
set output "tbuoh-phi10.eps"
set yrange[18:45]
set xrange [-10:160]
set xlabel "Time, ms"
set ylabel "Pressure, bar" offset 2
set title "{/=24 {/Times-Italic t}-Butanol/O_{2}/N_{2}, {/Times-Italic P_{/*0.75 C}}=30 bar, {/Symbol f}=1.0}"
unset key
set mxtics
set mytics 5
set xtics scale 1.25,0.75 
set ytics scale 1.25,0.75
set bmargin 3.5
set datafile separator ","

set label at 105,21 "{/=16 O_{2} : N_{2} = 1 : 3.76}"
set label at 148,35 rotate by 90 tc rgb "#000000" "{/=14 {/Times-Italic T_{C}} = 728 K}"
set label at 81,37 rotate by 90 tc rgb "#FF0000" "{/=14 750 K}"
set label at 45,37 rotate by 90 tc rgb "#006400" "{/=14 777 K}"
set label at 22,37 rotate by 90 tc rgb "#0000FF" "{/=14 810 K}"
set label at 7,37 rotate by 90 tc rgb "#FF00FF" "{/=14 856 K}"
set label at 90,23 right tc rgb "#666699" "{/=14 Non-Reactive}"

set arrow from 90,23 to 100,25.5 filled size 0.01,15 lc rgb "#666699" lw 1.5

plot 'tbuoh-phi10.txt' u 1:2 w lines lt 1 lw 1.5 lc rgb "#000000",\
     'tbuoh-phi10.txt' u 3:4 w lines lt 1 lw 1.5 lc rgb "#FF0000",\
     'tbuoh-phi10.txt' u 5:6 w lines lt 1 lw 1.5 lc rgb "#006400",\
     'tbuoh-phi10.txt' u 7:8 w lines lt 1 lw 1.5 lc rgb "#0000FF",\
     'tbuoh-phi10.txt' u 9:10 w lines lt 1 lw 1.5 lc rgb "#FF00FF",\
     'tbuoh-phi10.txt' u ($11+1):12 w lines lt 1 lw 1.5 lc rgb "#666699"

set output