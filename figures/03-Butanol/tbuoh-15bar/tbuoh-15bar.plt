reset
set term postscript enhanced eps font "Times,18" color size 9cm,7cm dl 2.0
set output "tbuoh-15bar.eps"
set yrange[5:25]
set xrange [-10:160]
set xlabel "Time, ms"
set ylabel "Pressure, bar" offset 2
set title "{/=24 {/Times-Italic t}-Butanol/O_{2}/N_{2}, {/Times-Italic P_{/*0.75 C}}=15 bar, {/Symbol f}=1.0}"
unset key
set mxtics
set mytics 5
set xtics scale 1.25,0.75 
set ytics scale 1.25,0.75
set bmargin 3.5
set datafile separator ","

set label at 5,8 "{/=16 O_{2} : N_{2} = 1 : 3.76}"
set label at 148,15 rotate by 90 tc rgb "#000000" "{/=14 {/Times-Italic T_{C}} = 800 K}"
set label at 112,17 rotate by 90 tc rgb "#FF0000" "{/=14 811 K}"
set label at 85,17 rotate by 90 tc rgb "#006400" "{/=14 822 K}"
set label at 66,17 rotate by 90 tc rgb "#0000FF" "{/=14 828 K}"
set label at 51,17 rotate by 90 tc rgb "#FF00FF" "{/=14 838 K}"
set label at 41,17 rotate by 90 tc rgb "#00FFFF" "{/=14 853 K}"
set label at 110,10 right tc rgb "#666699" "{/=14 Non-Reactive}"

set arrow from 110,10 to 120,10.9 filled size 0.01,15 lc rgb "#666699" lw 1.5

plot 'tbuoh-15bar.txt' u 1:2 w lines lt 1 lw 1.5 lc rgb "#000000",\
     'tbuoh-15bar.txt' u 3:4 w lines lt 1 lw 1.5 lc rgb "#FF0000",\
     'tbuoh-15bar.txt' u 5:6 w lines lt 1 lw 1.5 lc rgb "#006400",\
     'tbuoh-15bar.txt' u 7:8 w lines lt 1 lw 1.5 lc rgb "#0000FF",\
     'tbuoh-15bar.txt' u 9:10 w lines lt 1 lw 1.5 lc rgb "#FF00FF",\
     'tbuoh-15bar.txt' u 11:12 w lines lt 1 lw 1.5 lc rgb "#00FFFF",\
     'tbuoh-15bar.txt' u ($13+0.7):14 w lines lt 1 lw 1.5 lc rgb "#666699"

set output