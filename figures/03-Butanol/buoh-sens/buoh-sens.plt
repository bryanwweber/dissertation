reset 
set term post enh eps color font "Times,15" size 10cm,10cm solid
set output "buoh-sens.eps"
unset ytics
set y2tics mirror rotate 90 20 scale 1.25 font ",18"
set my2tics 4
set xtics 0.5,1,8.5 scale 0 format ""
set style data histograms
set style histogram cluster gap 1
set border 10
set key at second 5,60 samplen 0.7 horizontal
set label at second 6.30,62 rotate by 90 "{/=18 750 K}"
set label at second 5.39,62 rotate by 90 "{/=18 1200 K}"
set style fill solid border -1
set x2range [-1:9.75] reverse
set x2zeroaxis lt -1
set ylabel "{/=24 {/Times-Italic i}-Butanol/O_{2}/N_{2}, 30 bar, {/Symbol f}=1.0}" offset -1
set y2label "{/=18 Percent Sensitivity}" offset -2
set grid xtics 
set style rectangle fs solid 0.15 noborder
set obj rect from second 6.6,55 to second 5,80
#
set label at second 0,-5.0 right rotate by 90 "ic4h9oh+ho2<=>ic4h8oh-1+h2o2"
set label at second 1,-5.0 right rotate by 90 "ic4h8oh-1+o2<=>ic4h8oh-1o2"  
set label at second 2,-5.0 right rotate by 90 "ic4h9oh+oh<=>ic4h8oh-3+h2o"  
set label at second 3, 5.0       rotate by 90 "ic4h9oh+oh<=>ic4h8oh-1+h2o"  
set label at second 4, 5.0       rotate by 90 "2ho2<=>h2o2+o2"              
set label at second 5,-5.0 right rotate by 90 "ic4h8oh-1o2<=>ic4h7oh-1ooh-3"
set label at second 6, 5.0       rotate by 90 "ic3h7o2<=>c3h6+ho2"          
set label at second 7,-5.0 right rotate by 90 "ic3h7o2<=>c3h6ooh2-1"        
set label at second 8, 5.0       rotate by 90 "ic4h8oh-1o2<=>ic3h6choh+ho2" 
set label at second 9,-5.0 right rotate by 90 "ic3h7cho+ho2<=>ic3h7co+h2o2" 
#
plot 'buoh-sens.txt' using 2 fc rgb "#333399" axes x2y2 title " ",\
     'buoh-sens.txt' using 3 fc rgb "#CC3399" axes x2y2 title " "

set output
reset