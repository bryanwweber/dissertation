reset
set term postscript enhanced eps font "NimbusRomNo9L-Regu,18" color size 9cm,7cm fontfile "../s050000l.pfa" fontfile "../n021023l.pfa" fontfile "../n021003l.pfa" dashed
set output "mch-energy.eps"
set logscale y
set mxtics
set mx2tics 5
set xtics scale 1.25,0.75 nomirror font ",18"

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

set ytics scale 1.25, 0.75 font ",18"
set xrange [1.07:1.5]

set yrange [1:50]
set key at 1.24,2 samplen 1 reverse Left width -13.5 font ",14"
set label at first 1.1, 2.2 "Experiments:" font ",14" 
set title "{/=24 MCH/O_{2}/N_{2}/Ar, {/StandardSymL f}=1.0, Mix #1, {/NimbusRomNo9L-ReguItal P_{/*0.75 C}}=25.5 bar}" offset 0,-1
set ylabel "{/=18 Ignition Delay, ms}" offset 1
set xlabel "{/=18 1000/{/NimbusRomNo9L-ReguItal T_{/*0.75 C}}, 1/K}"
set label at first 1.425,10 "E_{a}= 41.6 kcal/mol" tc rgb "blue" rotate by 55 font ",14"
set label at first 1.425,4.25  "E_{a}= 39.0 kcal/mol" tc rgb "red" rotate by 50 font ",14"
set label at first 1.35,31 center "Simulated\nOverall" font ",14"
set label at first 1.442,2 center "Simulated\nFirst Stage" font ",14"
set arrow from first 1.35,23 to 1.4,11.75 filled size 0.01,15
set arrow from first 1.35,23 to 1.38,7.4 filled size 0.01,15
set arrow from first 1.41,1.8 to 1.33,3.5 filled size 0.01, 15
set arrow from first 1.41,1.8 to 1.333,1.5 filled size 0.01, 15
plot "Mix 1 25 bar Expt.txt" using 2:4 with points lc rgb "#006400" pt 4 ps 1 title "Overall Ignition Delay",\
     "Mix 1 25 bar Expt.txt" using 2:3 with points pt 5 ps 1 lc rgb "#006400" title "First Stage Ignition Delay",\
     "Mix 1 25 bar.txt" using 2:3 smooth csplines with lines lc rgb "blue" lt 1 notitle,\
     "Mix 1 25 bar.txt" using 2:4 smooth csplines with lines lt 2 lc rgb "blue" notitle,\
     "Mix 1 25 bar v9i.txt" using 2:3 smooth csplines with lines lc rgb "red" lt 1 notitle,\
     "Mix 1 25 bar v9i.txt" using 2:4 smooth csplines with lines lt 2 lc rgb "red" notitle
set output
reset
