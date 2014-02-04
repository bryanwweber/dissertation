reset
set term postscript enhanced eps font "Times,18" color size 9cm,7cm dl 2.0
set output "tbuoh-sims.eps"
set yrange[7:200]
set logscale y
set xrange [1.05:1.45]
set xlabel "1000/{/Times-Italic T_{/*0.75 C}}, 1/K"
set ylabel "Ignition Delay, ms" offset 2
set title "{/=24 {/Times-Italic t}-Butanol/O_{2}/N_{2}, {/Times-Italic P_{/*0.75 C}}=30 bar" offset 0,-0.75
set key at 1.04,100 Left reverse width -11 height 0.25 spacing 1.1 tc variable font ",14" samplen 0.5
set mxtics
set mx2tics 5
set xtics scale 1.25,0.75 nomirror
set x2tics scale 1.25,0.75 border 650, 50 format "%g K"
inv2k(x) = 1000./x
set x2range [inv2k(1.05):inv2k(1.45)]
set ytics scale 1.25,0.75
set bmargin 3.5

set label at 1.3,9 "{/=16 O_{2} : N_{2} = 1 : 3.76}"
set label at 1.08,150 "{/=14 Points: Experiments}\n{/=14 Solid Lines: Simulations}"

f10(x) = A10 + Ea10*x
fit f10(x) 'tbuoh-sims.txt' i 0 u 1:(log($2)) via A10,Ea10
f05(x) = A05 + Ea05*x
fit f05(x) 'tbuoh-sims.txt' i 1 u 1:(log($2)) via A05,Ea05
f20(x) = A20 + Ea20*x
fit f20(x) 'tbuoh-sims.txt' i 2 u 1:(log($2)) via A20,Ea20

plot "tbuoh-sims.txt" i 1 u 1:2:3 w errorbars lt 1 lc rgb "#000000" pt 06 ps 1.5 notitle,\
     "tbuoh-sims.txt" i 1 u 1:2 w points lc rgb "#000000" pt 06 ps 1.5 title "{/Symbol f}=0.5",\
     "tbuoh-sims.txt" i 1 u 1:4 w lines lt 1 lc rgb "#000000" notitle,\
     "tbuoh-sims.txt" i 0 u 1:2:3 w errorbars lt 1 lc rgb "#FF0000" pt 04 ps 1.5 notitle,\
     "tbuoh-sims.txt" i 0 u 1:2 w points lc rgb "#FF0000" pt 04 ps 1.5 title "{/Symbol f}=1.0",\
     "tbuoh-sims.txt" i 0 u 1:4 w lines lt 1 lc rgb "#FF0000" notitle,\
     "tbuoh-sims.txt" i 2 u 1:2:3 w errorbars lt 1 lc rgb "#006400" pt 12 ps 1.5 notitle,\
     "tbuoh-sims.txt" i 2 u 1:2 w points lc rgb "#006400" pt 12 ps 1.5 title "{/Symbol f}=2.0",\
     "tbuoh-sims.txt" i 2 u 1:4 w lines lt 1 lc rgb "#0064000" notitle,\
     (1.1680 < x && x< 1.3730) ? exp(f10(x)):1/0 w lines lt 2 lw 1.5 lc rgb "#FF0000" notitle,\
     (1.0960 < x && x< 1.2630) ? exp(f05(x)):1/0 w lines lt 2 lw 1.5 lc rgb "#000000" notitle,\
     (1.2340 < x && x< 1.4010) ? exp(f20(x)):1/0 w lines lt 2 lw 1.5 lc rgb "#006400" notitle
set output