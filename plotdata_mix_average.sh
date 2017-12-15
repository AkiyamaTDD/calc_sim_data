#!/bin/bash
gnuplot << EOF
set datafile separator ","
set terminal png
set grid            #目盛線を描画することを指定
set key outside

set xlabel "joint number"
set xrange [ 1 : 20 ]
set xtics 1

set ylabel "torque average [Nm]"
set yrange [ 0 : 10 ]
set ytics 10
set mytics 5

set output "torque_average.png" #$1は第1引数、ここではデータファイルの拡張子なしの文字列

set title "torque_average"

plot "$1.dat" using 1:2 t "k=0.000" w lp ,\
"$2.dat" using 1:2 t "k=0.010" w lp ,\
"$3.dat" using 1:2 t "k=0.020" w lp,\
"$4.dat" using 1:2 t "k=0.030" w lp,\
"$5.dat" using 1:2 t "k=0.040" w lp,\
"$6.dat" using 1:2 t "k=0.050" w lp,\
"$7.dat" using 1:2 t "k=0.060" w lp,\
"$8.dat" using 1:2 t "k=0.070" w lp,\
"$9.dat" using 1:2 t "k=0.080" w lp,\
"${10}.dat" using 1:2 t "k=0.090" w lp,\
"${11}.dat" using 1:2 t "k=0.100" w lp,\
"${12}.dat" using 1:2 t "k=0.110" w lp,\
"${13}.dat" using 1:2 t "k=0.120" w lp,\
"${14}.dat" using 1:2 t "k=0.130" w lp,\
"${15}.dat" using 1:2 t "k=0.140" w lp,\
"${16}.dat" using 1:2 t "k=0.150" w lp,\
"${17}.dat" using 1:2 t "k=0.160" w lp,\
"${18}.dat" using 1:2 t "k=0.170" w lp,\



EOF


