reset
set term postscript enhanced eps font "Times,18" color size 10cm,10cm dl 2.0
set output "buoh-heat.eps"
set multiplot

set yrange[0:15]
set xrange [0:100]
set size 1,1
set origin 0,0
set xlabel "Fuel Conversion, %"
set ylabel "Total Cumulative Heat Release, J/cm^{3}" offset 2
set title "{/=24 Cumulative Heat Release, 750 K, 30 bar, {/Symbol f}=1.0}"
set key at 78,3.5 Left reverse width -11 height 0.25 spacing 1.1 tc variable font ",14" samplen 1.0
set mxtics 4
set mytics 5
set xtics 10 scale 1.25,0.75 nomirror 
set ytics 5 scale 1.25,0.75
set bmargin 3.5
set datafile separator ","
set border 11

plot 'buoh-heat-main.txt' u 1:2 w lines lt 1 lw 1.5 lc rgb "#FF0000" title "{/Times-Italic t}-Butanol",\
     'buoh-heat-main.txt' u 3:4 w lines lt 1 lw 1.5 lc rgb "#0000FF" title "{/Times-Italic i}-Butanol",\
     'buoh-heat-main.txt' u 5:6 w lines lt 1 lw 1.5 lc rgb "#006400" title "{/Times-Italic s}-Butanol",\
     'buoh-heat-main.txt' u 7:8 w lines lt 1 lw 1.5 lc rgb "#CC00FF" title "{/Times-Italic n}-Butanol"

set size 0.7,0.55
set origin 0.1,0.39
set yrange [0:0.9]
unset title
set ytics 0.1 font ",12"
set xtics font ",12"
set mytics 2
set ylabel "{/=13 Cumulative Heat Release, J/cm^{3}}" offset 3
set xlabel font ",13" offset 0,0.5
set key at screen 0.64,0.93 font ",11" spacing 1.3
plot "buoh-heat-inset.txt" u 1:2 w lines lt 1 lw 1.5 lc rgb "#FF0000" title "tch48oh+o2<=>tch48oh-o2\n{/Times-Italic t}-Butanol",\
     "buoh-heat-inset.txt" u 3:4 w lines lt 1 lw 1.5 lc rgb "#0000FF" title "ich48oh-1+o2<=>ic3h7cho+ho2\n{/Times-Italic i}-Butanol",\
     "buoh-heat-inset.txt" u 5:6 w lines lt 1 lw 1.5 lc rgb "#006400" title "sch48oh-1+o2<=>c2h5coch3+ho2\n{/Times-Italic s}-Butanol",\
     "buoh-heat-inset.txt" u 7:8 w lines lt 1 lw 1.5 lc rgb "#CC00FF" title "2ho2<=>h2o2+o2\n{/Times-Italic n}-Butanol",\

unset multiplot
set output