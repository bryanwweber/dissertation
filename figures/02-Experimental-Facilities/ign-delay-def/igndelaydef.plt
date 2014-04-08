reset
set term postscript enhanced eps font "Times-Roman,18" color size 9cm,7cm
set output "ign-delay-def.eps"
set yrange [-5:80]
set xrange [-20:10]
set xlabel "Time, ms"
set ylabel "Pressure, bar\nTime Derivative of Pressure, bar/ms" offset 2
set title "{/=24 MCH/O_{2}/N_{2}/Ar, {/Symbol f}=1.5, {/Times-Italic P_{/*0.75 C}}=50 bar, {/Times-Italic T_{/*0.75 C}}=761 K}"
set xtics scale 1.25,0.75
set ytics scale 1.25,0.75
set style data lines
set mxtics
set mytics 5
set key at -2,75 Left reverse width -5 height 0.5 tc variable samplen 2
set arrow from 0,-5 to 0,20 nohead lw 1 lt 1 lc rgb "black" 
set arrow from 0,5 to 4.4,5 filled heads size 0.6,15 lw 1
set arrow from 4.4,-5 to 4.4,6 nohead lw 1 lt 1 lc rgb "black"
set arrow from 5.35,-5 to 5.35,20 nohead lw 1 lt 1 lc rgb "black"
set arrow from 0,17 to 5.35,17 filled heads size 0.6,15 lw 1
set xzeroaxis lw 1.5 lt -1
set label "{/Symbol t}_{/=9 1}" at 2.2,9.5
set label "{/Symbol t}" at 2.2, 20
set label 'EOC' at 0,22.5 center
plot "Definition-Of-Ignition-Delay.TXT" using 1:2 lt 1 lc rgb "black" lw 1.75 title "{/Times-Italic P(t)}, bar",\
'' using 1:3 lt 1 lc rgb "#7D7D7D" lw 1.5 title "{/Times-Italic P'(t)}, bar",\
'' using 1:4 lt 2 lc rgb "red" lw 1.75 title "{/Times-Italic P(t)} Non-Reactive, bar"
set output
exit