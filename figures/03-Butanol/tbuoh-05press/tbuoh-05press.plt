reset
set term postscript enhanced eps font "Times,18" color size 9cm,7cm dl 2.0
set output "tbuoh-05press.eps"
set yrange[18:45]
set xrange [-10:140]
set xlabel "Time, ms"
set ylabel "Pressure, bar" offset 2
set title "{/=24 {/Times-Italic t}-Butanol/O_{2}/N_{2}, {/Times-Italic P_{/*0.75 C}}=30 bar, {/Symbol f}=0.5}"
set key at 60,40 Left reverse width -11 height 0.25 spacing 1.1 tc variable font ",14" samplen 1.0
set mxtics 4
set mytics 5
set xtics scale 1.25,0.75 
set ytics scale 1.25,0.75
set bmargin 3.5
set datafile separator ","

set label at 90,21 "{/=16 O_{2} : N_{2} = 1 : 3.76}"

plot 'tbuoh-05press.txt' u 1:2 every ::::17500 w lines lt 1 lw 1.5 lc rgb "#000000" title "T_{C} = 792 K, Experiment",\
     'tbuoh-05press.txt' u 3:4 every ::::17500 w lines lt 1 lw 1.5 lc rgb "#666699" title "T_{C} = 792 K, Non-Reactive",\
     'tbuoh-05press.txt' u 5:6 every ::::10000 w lines lt 1 lw 1.5 lc rgb "#006400" title "T_{C} = 792 K, Simulation"

set output