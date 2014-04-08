reset
set term post enh eps color font "NimbusRomNo9L-Regu,13" size 9cm,9cm solid fontfile "../s050000l.pfa" fontfile "../n021023l.pfa" fontfile "../n021003l.pfa"
set output "mch-sens.eps"
unset ytics
set y2tics mirror rotate 90 0.1 scale 1.25 font ",14"
set my2tics 5
#set xtics scale 0 rotate by 90
unset xtics
set style data histograms
set style histogram cluster gap 1
set border 10
#set key horizontal samplen 0.09 width -1
unset key
set arrow from second 5,-0.7 to second 5,0.5 nohead
set arrow from second 5.5,-0.7 to second 4.5,-0.7 heads
set arrow from second 5.5,0.5 to second 4.5,0.5 heads
set arrow from second 11,-0.7 to second 11,0.5 nohead
set arrow from second 11.5,-0.7 to second 10.5,-0.7 heads
set arrow from second 11.5,0.5 to second 10.5,0.5 heads
#set label 1 "{/=12 T = 700 K}" right rotate by 90 at second 4.625,0.49
#set label 2 "{/=12 T = 800 K}" right rotate by 90 at second 5.375,0.49
#set label 3 "{/=12 T = 800 K}" right rotate by 90 at second 10.625,0.49
#set label 4 "{/=12 T = 900 K}" right rotate by 90 at second 11.375,0.49
set label 5 "{/=14 T = 700 K}" left rotate by 90 at second 2,-0.7
set label 6 "{/=14 T = 800 K}" left rotate by 90 at second 8,-0.7
set label 7 "{/=14 T = 900 K}" left rotate by 90 at second 14,-0.7
#set boxwidth 0.8 relative
set style fill solid border -1
#set yrange [-80:110]
set x2range [-1:16.75] reverse
#set arrow from -1,0 to 15,0 nohead
set x2zeroaxis lt -1
set ylabel "{/=24 Ignition Delay Sensitivity, 25.5 bar, Mix #1}" offset -1
set y2label "{/=18 Sensitivity Index}" offset -2
#set object rectangle from graph 0.185,0.035 to graph 0.025,0.16 fs empty border rgb "black" lw 2.5
#
set label at second 0,-0.02 right rotate by 90 "mch + oh = mchr1 + h2o"
set label at second 1,0.02        rotate by 90 "mch + oh = mchr2 + h2o"
set label at second 2,-0.02 right rotate by 90 "mch2oo = mch2ene + ho2"
set label at second 3,-0.02 right rotate by 90 "mch3oo = mch2ene + ho2"
set label at second 4,0.02        rotate by 90 "mch2qx+o2 = mch2qxqj"
#
set label at second 6,0.02        rotate by 90 "mch2qx+o2 = mch2qxqj"
set label at second 7,0.02        rotate by 90 "mch + oh = mchr2 + h2o"
set label at second 8,0.02        rotate by 90 "mch + oh = cychexch2 + h2o"
set label at second 9,-0.02 right rotate by 90 "mch2oo = mch2ene + ho2"
set label at second 10,0.02       rotate by 90 "mch + ho2 = mchr2 + h2o2"
#
set label at second 12,0.02 rotate by 90 "mch + ho2 = mchr2 + h2o2"
set label at second 13,0.02 rotate by 90 "mch + oh = cychexch2 + h2o"
set label at second 14,0.02 rotate by 90 "mch + ho2 = mchr3 + h2o2"
set label at second 15,0.02 rotate by 90 "mch2qx+o2 = mch2qxqj"
set label at second 16,0.02 rotate by 90 "mch + ho2 = mchr4 + h2o2"
#
set label at second -0.25, 0.277646071       rotate by 90 "{/=12 (1)}"
set label at second  0.75,-0.255027800 right rotate by 90 "{/=12 (2)}"
set label at second  1.75, 0.173859487       rotate by 90 "{/=12 (3)}"
set label at second  2.75, 0.146557186       rotate by 90 "{/=12 (6)}"
set label at second  3.75,-0.153666210 right rotate by 90 "{/=12 (5)}"
#
set label at second  5.75,-0.331629380 right rotate by 90 "{/=12 (8)}"
set label at second  6.75,-0.479898490 right rotate by 90 "{/=12 (2)}"
set label at second  7.75,-0.388617899 right rotate by 90 "{/=12 (7)}"
set label at second  8.75, 0.465278304       rotate by 90 "{/=12 (3)}"
set label at second  9.75,-0.284080329 right rotate by 90 "{/=12 (10)}"
#
plot newhistogram "", 'log_sensitivity.txt' index '700K' using 1 fc rgb "blue" axes x2y2, '' index '700K' using 2 fc rgb "red" axes x2y2,\
     newhistogram "", '' index '800K' using 1 fc rgb "#008000" axes x2y2, '' index '800K' using 2 fc rgb "grey" axes x2y2,\
     newhistogram "", '' index '900K' using 1 fc rgb "black" axes x2y2     
set output
reset