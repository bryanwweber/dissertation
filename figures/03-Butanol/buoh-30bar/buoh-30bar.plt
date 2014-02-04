reset
set term postscript enhanced eps font "Times,18" color size 9cm,7cm dl 2.0
set output "buoh-30bar.eps"
set yrange[5:300]
set logscale y
set xrange [1.15:1.50]
set xlabel "1000/{/Times-Italic T_{/*0.75 C}}, 1/K"
set ylabel "Ignition Delay, ms" offset 2
set title "{/=24 Butanol/O_{2}/N_{2}, {/Times-Italic P_{/*0.75 C}}=30 bar, {/Symbol f}=1.0}" offset 0,-0.75
set key at 1.17,250 Left reverse width -11 height 0.25 spacing 1.1 tc variable font ",14" samplen 0.5
set mxtics
set mx2tics 5
set xtics scale 1.25,0.75 nomirror
set x2tics scale 1.25,0.75 border 650, 50 format "%g K"
inv2k(x) = 1000./x
set x2range [inv2k(1.15):inv2k(1.50)]
set ytics scale 1.25,0.75
set bmargin 3.5

set label at 1.19,8 "{/=16 O_{2} : N_{2} = 1 : 3.76}"

fs(x) = As + Eas*x
fit fs(x) 'buoh-30bar.txt' i 0 u 1:(log($2)) via As,Eas
fi(x) = Ai + Eai*x
fit fi(x) 'buoh-30bar.txt' i 1 u 1:(log($2)) via Ai,Eai
fn(x) = An + Ean*x
fit fn(x) 'buoh-30bar.txt' i 2 u 1:(log($2)) via An,Ean
ft(x) = At + Eat*x
fit ft(x) 'buoh-30bar.txt' i 3 u 1:(log($2)) via At,Eat

plot "buoh-30bar.txt" i 3 u 1:2:3 w errorbars lt 1 lc rgb "#FF0000" pt 06 ps 1.5 notitle,\
     "buoh-30bar.txt" i 3 u 1:2 w points lc rgb "#FF0000" pt 06 ps 1.5 title "{/Times-Italic t}-Butanol",\
     "buoh-30bar.txt" i 1 u 1:2:3 w errorbars lt 1 lc rgb "#0000FF" pt 04 ps 1.5 notitle,\
     "buoh-30bar.txt" i 1 u 1:2 w points lc rgb "#0000FF" pt 04 ps 1.5 title "{/Times-Italic i}-Butanol",\
     "buoh-30bar.txt" i 0 u 1:2:3 w errorbars lt 1 lc rgb "#006400" pt 12 ps 1.5 notitle,\
     "buoh-30bar.txt" i 0 u 1:2 w points lc rgb "#006400" pt 12 ps 1.5 title "{/Times-Italic s}-Butanol",\
     "buoh-30bar.txt" i 2 u 1:2:3 w errorbars lt 1 lc rgb "#FF00FF" pt 8 ps 1.5 notitle,\
     "buoh-30bar.txt" i 2 u 1:2 w points lc rgb "#FF00FF" pt 8 ps 1.5 title "{/Times-Italic n}-Butanol",\
     (1.1639 < x && x< 1.3855) ? exp(fs(x)):1/0 w lines lt 2 lw 1.5 lc rgb "#006400" notitle,\
     (1.1674 < x && x< 1.3271) ? exp(fi(x)):1/0 w lines lt 2 lw 1.5 lc rgb "#0000FF" notitle,\
     (1.3141 < x && x< 1.4745) ? exp(fn(x)):1/0 w lines lt 2 lw 1.5 lc rgb "#FF00FF" notitle,\
     (1.1683 < x && x< 1.3731) ? exp(ft(x)):1/0 w lines lt 2 lw 1.5 lc rgb "#FF0000" notitle
set output