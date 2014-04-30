reset
set term postscript enhanced eps font "NimbusRomNo9L-Regu,18" color size 9cm,7cm fontfile "../s050000l.pfa" fontfile "../n021023l.pfa" fontfile "../n021003l.pfa"
set output "mch-expts.eps"
set key box at 1.3,80 Left reverse width -11 height 0.25 spacing 1.1 tc variable font ",14" samplen 0.5
set ylabel "Ignition Delay, ms" offset 2
set xlabel "1000/{/NimbusRomNo9L-ReguItal T_{/*0.75 C}}, 1/K"
set title "{/=24 MCH/O_{2}/N_{2}/Ar, {/NimbusRomNo9L-ReguItal P_{/*0.75 C}}=50 bar}" offset 0,-0.75
set xrange [1.1:1.46]
set logscale y
set mxtics
set xtics scale 1.25,0.75 nomirror

inv2k(x) = 1000./x
set x2tics ("" inv2k(600)) scale 1.25,0.75
do for [temp=650:950:50] {
t = sprintf("%g K",temp)
set x2tics add (t inv2k(temp))
set x2tics add ("" inv2k(temp+10) 1)
set x2tics add ("" inv2k(temp+20) 1)
set x2tics add ("" inv2k(temp+30) 1)
set x2tics add ("" inv2k(temp+40) 1)
}

set ytics scale 1.25,0.75
set bmargin 3.5
plot "phi=1.5 50 bar.txt" using 1:2:3 with errorbars lc rgb "#006400" pt 12 ps 1.5 notitle,\
     "phi=1.5 50 bar.txt" using 1:2 w points lc rgb "#006400" pt 12 ps 1.5 title "{/StandardSymL f}=1.5, Mix #3, Overall",\
     "phi=1.5 50 bar.txt" using 1:4:5 with errorbars lt 1 lc rgb "#006400" pt 13 notitle,\
     "phi=1.5 50 bar.txt" using 1:4 w points pt 13 lc rgb "#006400" title "{/StandardSymL f}=1.5, Mix #3, First Stage",\
     "phi=1.0 50 bar.txt" using 1:2:3 w errorbars lt 1 lc rgb "red" pt 8 ps 1.5 notitle,\
     "phi=1.0 50 bar.txt" using 1:2 w points lc rgb "red" pt 8 ps 1.5 title "{/StandardSymL f}=1.0, Mix #1, Overall",\
     "phi=1.0 50 bar.txt" using 1:4:5 with errorbars lt 1 lc rgb "red" pt 9 notitle,\
     "phi=1.0 50 bar.txt" using 1:4 w points lc rgb "red" pt 9 title "{/StandardSymL f}=1.0, Mix #1, First Stage",\
     "phi=0.5 50 bar.txt" using 1:2:3 w errorbars lt 1 lc rgb "blue" pt 6 ps 1.5 notitle,\
     "phi=0.5 50 bar.txt" using 1:2 w points lc rgb "blue" pt 6 ps 1.5 title "{/StandardSymL f}=0.5, Mix #2, Overall"
set output
