#!/bin/bash
export LANG="en_US.UTF-8"
export LC_COLLATE=C
export LC_ALL=C

soubor=`echo "$1" | sed "s/\.csv//" | sed "s/data\///"`
nazev=`echo "$soubor" | sed "s/_/ /g"`
plot_string="in 0 u 1:2 t 'směr 1'  with steps linestyle 1 linetype rgb 'red' lw 1,\
   '' in 0 u 1:3 t 'směr 2'  with steps linestyle 1 linetype rgb 'green' lw 1,\
   '' in 0 u 1:4 t 'součet' with steps linestyle 1 linetype rgb 'blue' lw 1"
temp_string="in 0 u 1:5 axes x1y2 with steps t 'teplota' linestyle 1 linetype rgb '#66FFFF' lw 1, ''"

if [ "$2" == PNG ]; then
   output_folter="grafy-png"
   output_suffix="png"
   html="#"
   svg="#"
   temp="#"
   plot=$plot_string
else if [ "$2" == SVG ]; then
   output_folter="grafy-svg"
   output_suffix="svg"
   png="#"
   html="#"
   plot=$temp_string$plot_string
else
   output_folter="grafy"
   output_suffix="html"
   png="#"
   svg="#"
   plot=$temp_string$plot_string
fi
fi

gnuplot <<EOF
reset
#set terminal postscript enhanced color
${png}set terminal pngcairo enhanced truecolor size 1024,768
${html}set terminal canvas size 1024,768 jsdir "http://gnuplot.sourceforge.net/demo_canvas_4.6/" enhanced standalone mousing
${svg}set term svg mouse enhanced size 1024,768 dynamic jsdir "http://gnuplot.sourceforge.net/demo_svg_4.6/"
set datafile commentschars "#"
set locale "cs_CZ.UTF-8"
#set decimalsign locale "cs_CZ.UTF-8"
set decimalsign "."
set format y "%'.0f"
set encoding utf8
set title "Počet cyklistů na měřeném profilu ${nazev}"
set ylabel "Počet průjezdů"
${temp}set y2label "Teplota"
set y2tics nomirror tc lt 3
set xlabel "Čas"
set datafile separator ";"
set grid

set xtics rotate
set xdata time
set format x "%b %Y"
set timefmt "%Y-%m-%d %H:%M"
#set xrange ["2010-11-03 01:00":"2010-11-16 13:00"]

set output "$output_folter/$soubor-hodiny.$output_suffix"
plot "<gawk -v regexp='' -f prevod.awk \"data/$soubor.csv\"" \
${plot}

set title "Počet cyklistů na měřeném profilu ${nazev} - součty po týdnu"

set output "$output_folter/$soubor-tydny.$output_suffix"
plot "<gawk -v regexp='Sun .* 00:00:00' -f prevod.awk \"data/$soubor.csv\"" \
${plot}

set title "Počet cyklistů na měřeném profilu ${nazev} - součty po dni"

set output "$output_folter/$soubor-dny.$output_suffix"
plot "<gawk -v regexp='00:00:00' -f prevod.awk \"data/$soubor.csv\"" \
${plot}

set title "Počet cyklistů na měřeném profilu ${nazev} - součty po měsíci"

set output "$output_folter/$soubor-mesice.$output_suffix"
plot "<gawk -v regexp=' 01 00:00:00' -f prevod.awk \"data/$soubor.csv\"" \
${plot}

set title "Počet cyklistů na měřeném profilu ${nazev} - součty po roce"

set output "$output_folter/$soubor-roky.$output_suffix"
plot "<gawk -v regexp='Jan 01 00:00:00' -f prevod.awk \"data/$soubor.csv\"" \
${plot}
EOF
