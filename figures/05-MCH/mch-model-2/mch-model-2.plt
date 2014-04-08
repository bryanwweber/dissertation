reset
set term postscript enhanced eps font "Times-Roman,18" color size 9cm,7cm
unset key
set xlabel "1000/{/Times-Italic T_{/*0.75 C}}, 1/K"
set logscale y
set mxtics
set mx2tics 5
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

set ytics scale 1.25, 0.75
#set multiplot layout 2,1 title "{/=24 MCH/O_{2}/N_{2}/Ar, {/Symbol f}=0.5, Mix #2}"
#set tmargin 4
set label 1 "{/Times-Italic P_{/*0.75 C}} = 15.1 bar" tc rgb "blue" 
set label 2 "{/Times-Italic P_{/*0.75 C}} = 25.5 bar" tc rgb "red"
set label 3 "{/Times-Italic P_{/*0.75 C}} = 50.0 bar" tc rgb "#006400"
set label 4 "Symbols - Experiments\n\Lines - Simulations" font ",16"
#
set output "mch-model-2-first.eps"
#set title "{/=24 (a)}" offset 0,-1
set ylabel "First Stage Ignition Delay, ms" offset 2
set xrange [1.2:1.5]

set yrange [0.9:100]
set label 1 at first 1.21,4
set label 2 at first 1.21,1.4
set label 3 at first  1.37,1.5
set label 4 at first 1.21,70
plot "Mix 2 15 bar Expt.txt" using 2:3 with points pt 4 ps 1.5 lc rgb "blue",\
     "Mix 2 15 bar.txt" using 2:4 smooth csplines with lines lt 1 lw 1.5 lc rgb "blue",\
     "Mix 2 25 bar Expt.txt" using 2:3 with points pt 6 ps 1.5 lc rgb "red",\
     "Mix 2 25 bar.txt" using 2:4 smooth csplines with lines lt 1 lw 1.5 lc rgb "red",\
     "phi=0.5 50 bar.txt" using 1:4 with points pt 8 ps 1.5 lc rgb "#006400",\
     "phi=0.5 50 bar.txt" using 1:7 with lines lt 1 lw 1.5 lc rgb "#006400"
#
set output
#set tmargin 2.5
#
set output "mch-model-2-over.eps"
#set title "{/=24 (b)}"
set ylabel "Overall Ignition Delay, ms" offset 2
set xrange [1.07:1.5]

set yrange [1:100]
set label 1 at first 1.14,25
set label 2 at first 1.14,7
set label 3 at first 1.25,2.5
set label 4 at first 1.09,1.75
plot "Mix 2 15 bar Expt.txt" using 2:4 with points lc rgb "blue" pt 4 ps 1.5,\
     "Mix 2 15 bar.txt" using 2:3 smooth csplines with lines lw 1.5 lc rgb "blue" lt 1,\
     "Mix 2 25 bar Expt.txt" using 2:4 with points pt 6 ps 1.5 lc rgb "red",\
     "Mix 2 25 bar.txt" using 2:3 smooth csplines with lines lt 1 lw 1.5 lc rgb "red",\
     "phi=0.5 50 bar.txt" using 1:2 with points pt 8 ps 1.5 lc rgb "#006400",\
     "phi=0.5 50 bar.txt" using 1:6 with lines lt 1 lw 1.5 lc rgb "#006400"
set output
