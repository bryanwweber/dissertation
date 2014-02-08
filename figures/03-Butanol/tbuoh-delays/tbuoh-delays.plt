reset
set term postscript enhanced eps font "Times,18" color size 9cm,7cm dl 2.0
set output "tbuoh-delays.eps"
set yrange[7:200]
set logscale y
set xrange [1.05:1.45]
set xlabel "1000/{/Times-Italic T_{/*0.75 C}}, 1/K"
set ylabel "Ignition Delay, ms" offset 2
set title "{/=24 {/Times-Italic t}-Butanol/O_{2}/N_{2}, {/Times-Italic P_{/*0.75 C}}=30 bar" offset 0,-0.75
set key at 1.32,25 Left reverse width -11 height 0.25 spacing 1.1 tc variable font ",14" samplen 0.5
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

set label at 1.3,9 "{/=16 O_{2} : N_{2} = 1 : 3.76}"

f10(x) = A10 + Ea10*x
fit f10(x) 'tbuoh-delays.txt' i 0 u 1:(log($2)) via A10,Ea10
f05(x) = A05 + Ea05*x
fit f05(x) 'tbuoh-delays.txt' i 1 u 1:(log($2)) via A05,Ea05
f20(x) = A20 + Ea20*x
fit f20(x) 'tbuoh-delays.txt' i 2 u 1:(log($2)) via A20,Ea20

plot "tbuoh-delays.txt" i 1 u 1:2:3 w errorbars lt 1 lc rgb "#000000" pt 06 ps 1.5 notitle,\
     "tbuoh-delays.txt" i 1 u 1:2 w points lc rgb "#000000" pt 06 ps 1.5 title "{/Symbol f}=0.5",\
     "tbuoh-delays.txt" i 0 u 1:2:3 w errorbars lt 1 lc rgb "#FF0000" pt 04 ps 1.5 notitle,\
     "tbuoh-delays.txt" i 0 u 1:2 w points lc rgb "#FF0000" pt 04 ps 1.5 title "{/Symbol f}=1.0",\
     "tbuoh-delays.txt" i 2 u 1:2:3 w errorbars lt 1 lc rgb "#006400" pt 12 ps 1.5 notitle,\
     "tbuoh-delays.txt" i 2 u 1:2 w points lc rgb "#006400" pt 12 ps 1.5 title "{/Symbol f}=2.0",\
     (1.1680 < x && x< 1.3730) ? exp(f10(x)):1/0 w lines lt 2 lw 1.5 lc rgb "#FF0000" notitle,\
     (1.0960 < x && x< 1.2630) ? exp(f05(x)):1/0 w lines lt 2 lw 1.5 lc rgb "#000000" notitle,\
     (1.2340 < x && x< 1.4010) ? exp(f20(x)):1/0 w lines lt 2 lw 1.5 lc rgb "#006400" notitle
set output