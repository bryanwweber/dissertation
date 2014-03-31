reset
set encoding utf8
set term postscript enhanced eps font "Times-Roman,18" color size 9cm,7cm
set output "gcms-tic.eps"

set xrange [0:150]
set xlabel "Time, min"
set ylabel "Intensity, A.U." offset 1
set xtics scale 1.25,0.75
set ytics scale 1.25,0.75 format "%.1t×10^{%T}"
set style data lines
unset key
plot "Output.txt" using 1:2 lt 1 lc rgb "black" lw 1.5
set output
