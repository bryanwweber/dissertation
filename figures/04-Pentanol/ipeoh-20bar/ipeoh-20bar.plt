reset
set term postscript enhanced eps font "Times,18" color size 9cm,7cm dl 2.0
set output "ipeoh-20bar.eps"
set yrange[1E-02:200]
set logscale y
set xrange [0.7:1.6]
set xlabel "1000/{/Times-Italic T_{/*0.75 C}}, 1/K"
set ylabel "Ignition Delay, ms" offset 2
set title "{/=24 {/Times-Italic i}-Pentanol/O_{2}/N_{2}, {/Times-Italic P_{/*0.75 C}}=20 bar}" offset 0,-0.75
set key at 0.63,15 width -11 Left reverse height 0.25 spacing 1.1 tc variable font ",14" samplen 0
set mxtics
set xtics scale 1.25,0.75 nomirror

inv2k(x) = 1000./x
set x2tics ("" inv2k(600)) scale 1.25,0.75
do for [temp=600:800:100] {
t = sprintf("%g K",temp)
set x2tics add (t inv2k(temp))
set x2tics add ("" inv2k(temp+20) 1)
set x2tics add ("" inv2k(temp+40) 1)
set x2tics add ("" inv2k(temp+60) 1)
set x2tics add ("" inv2k(temp+80) 1)
}
do for [temp=900:1500:200] {
t = sprintf("%g K",temp)
set x2tics add (t inv2k(temp))
set x2tics add ("" inv2k(temp+20) 1)
set x2tics add ("" inv2k(temp+40) 1)
set x2tics add ("" inv2k(temp+60) 1)
set x2tics add ("" inv2k(temp+80) 1)
set x2tics add ("" inv2k(temp+100) 1)
set x2tics add ("" inv2k(temp+120) 1)
set x2tics add ("" inv2k(temp+140) 1)
set x2tics add ("" inv2k(temp+160) 1)
set x2tics add ("" inv2k(temp+180) 1)
}

set ytics scale 1.25,0.75
set mytics 10
set bmargin 3.5

set datafile separator ","

set label at 0.73,100 "Open Symbols: RCM\nFilled Symbols: ST\nSolid Lines: Const. Vol.\nDashed Lines: Vol. Pro." font ",14"

plot "ipeoh-20bar.txt" i 0 u 1:2 every ::::7 w p lc rgb "#0000FF" pt 06 ps 1.5 title "{/Symbol f}=0.5",\
     "ipeoh-20bar.txt" i 0 u 1:2 every ::8 w p lc rgb "#0000FF" pt 07 ps 1.5 notitle,\
     "ipeoh-20bar.txt" i 2 u 1:2 w l lc rgb "#0000FF" lt 1 lw 1.5 notitle,\
     "ipeoh-20bar.txt" i 0 u 1:3 w l lc rgb "#0000FF" lt 2 lw 1.5 notitle,\
     "ipeoh-20bar.txt" i 1 u 1:2 every ::::8 w p lc rgb "#FF0000" pt 04 ps 1.5 title "{/Symbol f}=1.0",\
     "ipeoh-20bar.txt" i 1 u 1:2 every ::9 w p lc rgb "#FF0000" pt 05 ps 1.5 notitle,\
     "ipeoh-20bar.txt" i 3 u 1:2 w l lc rgb "#FF0000" lt 1 lw 1.5 notitle,\
     "ipeoh-20bar.txt" i 1 u 1:3 w l lc rgb "#FF0000" lt 2 lw 1.5 notitle,\
     "ipeoh-20bar.txt" i 4 u 1:2 every ::::4 w p lc rgb "#006400" pt 8 ps 1.5 title "{/Symbol f}=2.0",\
     "ipeoh-20bar.txt" i 4 u 1:2 every ::5 w p lc rgb "#006400" pt 9 ps 1.5 notitle,\
     "ipeoh-20bar.txt" i 5 u 1:2 w l lc rgb "#006400" lt 1 lw 1.5 notitle,\
     "ipeoh-20bar.txt" i 4 u 1:3 w l lc rgb "#006400" lt 2 lw 1.5 notitle
     
set output
reset
     