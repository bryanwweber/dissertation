reset
set term post enh eps color font "Times-Roman,12" size 9cm,9cm solid
set output "ipeoh-40sens.eps"
unset ytics
set y2tics mirror rotate 90 20 scale 1.25 font ",14"
set my2tics 5
#set xtics scale 0 rotate by 90
unset xtics
set style data histograms
set style histogram cluster gap 1
set border 10
set key horizontal samplen 0.09 at graph 0.18,0.06 width -1
set label 1 at graph 0.103,0.065 "{/=14{/Symbol f} = 1.0}" rotate by 90
set label 2 at graph 0.053,0.065 "{/=14{/Symbol f} = 0.5}" rotate by 90
set label 3 at graph 0.153,0.065 "{/=14{/Symbol f} = 2.0}" rotate by 90
#set boxwidth 0.8 relative
set style fill solid border -1
set yrange [-100:160]
set xrange [-0.75:14.5] reverse
#set arrow from -1,0 to 15,0 nohead
set xzeroaxis lt -1
set ylabel "{/=24 Ignition Delay Sensitivity, 40 atm, 689 K}" offset -1
set y2label "{/=18 Percent Sensitivity}" offset -2
set object rectangle from graph 0.185,0.035 to graph 0.025,0.16 fs empty border rgb "black" lw 2.5
#
set label 4 at 0,-2 right rotate by 90 "ic5h11oh+oh<=>{/Symbol a}-hydroxypentyl+h2o"
set label 5 at 1,55 rotate by 90       "{/Symbol a}-hydroxypentyl+o2<=>iso-pentanal+ho2"
set label 6 at 2,2 rotate by 90        "ic5h11oh+oh<=>{/Symbol g}-hydroxypentyl+h2o"
set label 7 at 3,2 rotate by 90        "{/Symbol a}-hydroxypentyl+o2<=>ic5h10oh-1o2 (ROO)"
set label 8 at 4,2 rotate by 90        "ic5h11oh+ho2<=>{/Symbol a}-hydroxypentyl+h2o2"
set label 9 at 5,2 rotate by 90        "ic5h11oh+oh<=>{/Symbol d}-hydroxypentyl+h2o"
set label 10 at 6,15 rotate by 90      "2ho2<=>h2o2+o2"
set label 11 at 7,2 rotate by 90       "ic5h11oh+ho2<=>{/Symbol g}-hydroxypentyl+h2o2"
set label 12 at 8,12 rotate by 90      "ic5h10oh-3o2 (ROO)=>tc4h8o2h-i+ch2o"
set label 13 at 9,2 rotate by 90       "ic5h10oh-3o2 (ROO)<=>ic5h9oh-3ooh-1 (QOOH)"
set label 14 at 10,10 rotate by 90     "ic5h9oh-3ooh-1+o2<=>ic5h9oh-3ooh-1o2"
set label 15 at 11,2 rotate by 90      "ic5h10oh-4o2 (ROO)<=>ic5h9oh-4ooh-2 (QOOH)"
set label 16 at 12,15 rotate by 90     "ch2o+oh<=>hco+h2o"
set label 17 at 13,2 rotate by 90      "ic5h9oh-4ooh-1+o2<=>ic5h9oh-4ooh-1o2"
set label 18 at 14,2 rotate by 90      "ic5ketdb=>ch3coch3+ch2cho+oh"
#
#plot for [COL=3:5] '40 atm Sensitivity.txt' using COL:xticlabels(2)
plot '40 atm Sensitivity.txt' using 4 fc rgb "blue" title ' ', '40 atm Sensitivity.txt' using 3 fc rgb "red" title ' ',\
     '40 atm sensitivity.txt' using 5 fc rgb "#999999" title ' '
set output
reset