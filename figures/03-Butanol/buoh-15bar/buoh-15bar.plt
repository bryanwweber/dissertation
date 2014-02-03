reset
set term postscript solid enhanced eps font "Times,18" color size 9cm,7cm
set output "buoh-15bar.eps"
set yrange[10:200]
set logscale y
set xrange [1.13:1.40]
set xlabel "1000/{/Times-Italic T_{/*0.75 C}}, 1/K"
set ylabel "Ignition Delay, ms" offset 2
set title "{/=24 Butanol/O_{2}/N_{2}, {/Times-Italic P_{/*0.75 C}}=15 bar, {/Symbol f}=1.0}" offset 0,-0.75
set key at 1.28,150 Left reverse width -11 height 0.25 spacing 1.1 tc variable font ",14" samplen 0.5
set mxtics
set mx2tics 5
set xtics scale 1.25,0.75 nomirror
set x2tics scale 1.25,0.75 border 650, 50 format "%g K"
inv2k(x) = 1000./x
set x2range [inv2k(1.13):inv2k(1.40)]
set ytics scale 1.25,0.75
set bmargin 3.5
plot "buoh-15bar.txt" i 3 u 1:2:3 w errorbars lc rgb "#FF0000" pt 06 ps 1.5 notitle,\
     "buoh-15bar.txt" i 3 u 1:2 w points lc rgb "#FF0000" pt 06 ps 1.5 title "{/Times-Italic t}-Butanol",\
     "buoh-15bar.txt" i 1 u 1:2:3 w errorbars lc rgb "#0000FF" pt 04 ps 1.5 notitle,\
     "buoh-15bar.txt" i 1 u 1:2 w points lc rgb "#0000FF" pt 04 ps 1.5 title "{/Times-Italic i}-Butanol",\
     "buoh-15bar.txt" i 0 u 1:2:3 w errorbars lc rgb "#006400" pt 12 ps 1.5 notitle,\
     "buoh-15bar.txt" i 0 u 1:2 w points lc rgb "#006400" pt 12 ps 1.5 title "{/Times-Italic s}-Butanol",\
     "buoh-15bar.txt" i 2 u 1:2:3 w errorbars lc rgb "#FF00FF" pt 8 ps 1.5 notitle,\
     "buoh-15bar.txt" i 2 u 1:2 w points lc rgb "#FF00FF" pt 8 ps 1.5 title "{/Times-Italic n}-Butanol"
set output