reset
set term postscript enhanced eps font "Times-Roman,18" color size 7cm,7cm
#set output "mch-pressure.eps"
set datafile separator ","
set style data lines
set mxtics
set mytics 4
set xtics scale 1.25,0.75
set ytics scale 1.25,0.75
set ylabel "Pressure, bar" offset 2
set xlabel "Time, ms"
#set key Left top left samplen 2 reverse
unset key
#set multiplot layout 1,3# title "{/=24 MCH/O_{2}/N_{2}/Ar, {/NimbusRomNo9L-ReguItal P_{/*0.75 C}}=50 bar}"
#set rmargin 0.5
#
set style line 1 lc rgb "black" lt 1 lw 1.5
set style line 2 lc rgb "black" lt 2 lw 1.5
set style line 3 lc rgb "black" lt 8 lw 1.5
set style line 4 lc rgb "red" lt 1 lw 1.5
set style line 5 lc rgb "red" lt 2 lw 1.5
set style line 6 lc rgb "red" lt 8 lw 1.5
#
#set title "(a) Mix #1" offset 0
set yrange [30:90]
set xrange [-4:30]
#set key at graph -0.1,1.15
set output "mch-pressure-1.eps"
set arrow from first 21,36 to first 23,44.5 filled
set arrow from first 21,36 to first 27,47.5 filled
set label "Non-Reactive Pressure" at 20.75,36 right
set label "866 K" rotate by 90 at 2.75,70 tc rgb "red"
set label "690 K" at first 22,75 center
set arrow from first 19,75 to first 16.25,75 filled
set arrow from first 25,75 to first 27,75 filled
plot "exp_output_mix_1.csv" using 1:2 ls 1 title "Experiment", '' using 9:10 ls 4 title '',\
     "sim_output_mix_1.csv" using 1:2 ls 2 title "Simulation", '' using 9:10 ls 5 title '',\
     "non_output_mix_1.csv" using 1:2 ls 3 title '', '' using 9:10 ls 6 title ''
#
set output
#set lmargin 5
unset label
unset arrow
unset ylabel
#set title "(b) Mix #2" offset 0
#set key at graph -0.1,1.15
set yrange [30:90]
set xrange [-3:28]
set output "mch-pressure-2.eps"
set arrow from first 24,40 to first 27,47 filled
set label "Non-Reactive Pressure" at first 23.75,40 right
set label "691 K" at first 20,75 center
set arrow from first 23,75 to 26.5,75 filled
set arrow from first 17,75 to 14,75 filled
plot "exp_output_mix_2.csv" using 1:2 ls 1 title "Experiment",\
     "sim_output_mix_2.csv" using 1:2 ls 2 title "Simulation",\
     "non_output_mix_2.csv" using 1:2 ls 3 title ''
#
set output
unset label
unset arrow
#set title "(c) Mix #3" offset 0
#set rmargin 2
set yrange [30:90]
set xrange [-3:12]
#set key at graph -0.1,1.15
set output "mch-pressure-3.eps"
set arrow from first 9,36 to first 10,48 filled
set arrow from first 9,36 to first 11,48.5 filled
set label "Non-Reactive Pressure" at first 8.75,36 right
set label "797 K" at first 3.125,75 right tc rgb "red"
set arrow from first 3.25,74 to first 4.6,68 filled ls 4
set arrow from first 3.25,74 to first 6.625,68 filled ls 4
set label "729 K" at first 3.125,66 right
set arrow from first 3.25,65 to first 3.9,51 filled
set arrow from first 3.25,65 to first 10.2,56 filled
plot "exp_output_mix_3.csv" using 3:4 ls 1 title "Experiment", '' using 11:12 ls 4 title '',\
     "sim_output_mix_3.csv" using 3:4 ls 2 title "Simulation", '' using 11:12 ls 5 title '',\
     "non_output_mix_3.csv" using 3:4 ls 3 title '', '' using 11:12 ls 6 title ''
#
#unset multiplot
set output