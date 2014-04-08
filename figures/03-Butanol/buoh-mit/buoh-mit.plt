reset
set term postscript enhanced eps font "Times,18" color size 9cm,7cm dl 2.0
set output "buoh-mit.eps"
set yrange[7:380]
set logscale y
set xrange [1.14:1.35]
set xlabel "1000/{/Times-Italic T_{/*0.75 C}}, 1/K"
set ylabel "Ignition Delay, ms" offset 2
set title "{/=24 {/Times-Italic i}-Butanol/O_{2}/N_{2}, {/Symbol f}=1.0}" offset 0,-0.75
set key at 1.355,34 Left reverse width -11 height 0.25 spacing 1.1 tc variable font ",12" samplen 0.75
set mxtics
set mx2tics 5
set xtics scale 1.25,0.75 nomirror

inv2k(x) = 1000./x
set x2tics ("" inv2k(600)) scale 1.25,0.75
do for [temp=650:1000:50] {
t = sprintf("%g K",temp)
set x2tics add (t inv2k(temp))
set x2tics add ("" inv2k(temp+10) 1)
set x2tics add ("" inv2k(temp+20) 1)
set x2tics add ("" inv2k(temp+30) 1)
set x2tics add ("" inv2k(temp+40) 1)
}

set ytics scale 1.25,0.75
set bmargin 3.5

set label at 1.15,275 "{/=16 O_{2} : N_{2} = 1 : 3.76}"

f0(x) = A0 + Ea0*x
fit f0(x) 'buoh-mit.txt' i 0 u 1:(log($2)) via A0,Ea0
f1(x) = A1 + Ea1*x
fit f1(x) 'buoh-mit.txt' i 0 u 1:(log($4)) via A1,Ea1
f2(x) = A2 + Ea2*x
fit f2(x) 'buoh-mit.txt' i 0 u 1:(log($5)) via A2,Ea2
f3(x) = A3 + Ea3*x
fit f3(x) 'buoh-mit.txt' i 1 u 1:(log($2)) via A3,Ea3
f4(x) = A4 + Ea4*x
fit f4(x) 'buoh-mit.txt' i 1 u 1:(log($4)) via A4,Ea4
f5(x) = A5 + Ea5*x
fit f5(x) 'buoh-mit.txt' i 1 u 1:(log($5)) via A5,Ea5

plot "buoh-mit.txt" i 0 u 1:2:3 w points lc rgb "#000000" pt 04 ps 1.25 title "15 bar",\
     "buoh-mit.txt" i 0 u 1:2:3 w errorbars lt 1 lc rgb "#0000FF" pt 04 ps 1.25 notitle,\
     "buoh-mit.txt" i 0 u 1:4 w points lc rgb "#FF0000" pt 05 ps 1.25 notitle,\
     "buoh-mit.txt" i 0 u 1:5 w points lc rgb "#666666" pt 05 ps 1.25 notitle,\
     (1.1680 < x && x< 1.2260) ? exp(f0(x)):1/0 w lines lt 2 lw 1.5 lc rgb "#0000FF" notitle,\
     (1.1680 < x && x< 1.2120) ? exp(f1(x)):1/0 w lines lt 4 lw 1.5 lc rgb "#FF0000" notitle,\
     (1.1680 < x && x< 1.2260) ? exp(f2(x)):1/0 w lines lt 1 lw 1.5 lc rgb "#666666" notitle,\
     "buoh-mit.txt" i 1 u 1:2:3 w points lc rgb "#000000" pt 06 ps 1.25 title "30 bar",\
     "buoh-mit.txt" i 1 u 1:2:3 w errorbars lt 1 lc rgb "#0000FF" pt 06 ps 1.25 notitle,\
     "buoh-mit.txt" i 1 u 1:4 w points lc rgb "#FF0000" pt 07 ps 1.25 notitle,\
     "buoh-mit.txt" i 1 u 1:5 w points lc rgb "#666666" pt 07 ps 1.25 notitle,\
     (1.1670 < x && x< 1.3270) ? exp(f3(x)):1/0 w lines lt 2 lw 1.5 lc rgb "#0000FF" title "Experiments",\
     (1.1670 < x && x< 1.2820) ? exp(f4(x)):1/0 w lines lt 4 lw 1.5 lc rgb "#FF0000" title "MIT Mechanism",\
     (1.1670 < x && x< 1.3270) ? exp(f5(x)):1/0 w lines lt 1 lw 1.5 lc rgb "#666666" title "Sarathy et al. Mechanism"

set output