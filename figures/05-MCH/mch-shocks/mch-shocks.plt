reset
set term postscript enhanced eps font "NimbusRomNo9L-Regu,18" color size 9cm,7cm fontfile "../s050000l.pfa" fontfile "../n021023l.pfa" fontfile "../n021003l.pfa"
set output "mch-shocks.eps"
set title "{/=24 MCH/O_{2}/N_{2}, {/StandardSymL f}=1.0, 50 atm}" offset 0,-1
set xlabel "1000/{/NimbusRomNo9L-ReguItal T}, 1/K"
set ylabel "Overall Ignition Delay, {/StandardSymL m}s" offset 1.5

set logscale y
set yrange [10:3000]
set xrange [0.833333:1.3]
set xtics scale 1.25,0.75 nomirror
set mxtics
set ytics scale 1.25, 0.75

inv2k(x) = 1000./x
set x2tics ("700 K" inv2k(700)) scale 1.25,0.75
do for [temp=700:1200:100] {
t = sprintf("%g K",temp)
set x2tics add (t inv2k(temp))
set x2tics add ("" inv2k(temp+25) 1)
set x2tics add ("" inv2k(temp+50) 1)
set x2tics add ("" inv2k(temp+75) 1)
}

set key at first 1.28,14 bottom right samplen 2

plot "Vasu_data.txt" using (1000/$1):3 with points title "Vasu et al. (2009)" pt 5 ps 1 lc rgb "red",\
     "Vanderover_data.txt" using (1000/$1):3 with points title "Vanderover and Oehlschlaeger (2009)" pt 7 ps 1 lc rgb "blue",\
     "v9l_model.txt" using (1000/$1):3 smooth csplines with lines title "Present Model" lt -1

set output
reset