#!/bin/sh
gnuplot << EOF
set datafile separator ","
set terminal png
set grid            #目盛線を描画することを指定

set xlabel "time [s]"
set xrange [ 0 : 200 ]
set xtics 50
set mxtics 10

set ylabel "torque [Nm]"
set yrange [ -150 : 150 ]
set ytics 50
set mytics 10

set output "torque_$1.png" #$1は第1引数、ここではデータファイルの拡張子なしの文字列

set title "torque_$1"

plot "$1.dat" using 1:2 t "joint1" w l ,\
		 "$1.dat" using 1:3 t "joint2" w l ,\
		 "$1.dat" using 1:4 t "joint3" w l ,\
		 "$1.dat" using 1:5 t "joint4" w l ,\
		 "$1.dat" using 1:6 t "joint5" w l ,\
		 "$1.dat" using 1:7 t "joint6" w l ,\
		 "$1.dat" using 1:8 t "joint7" w l ,\
		 "$1.dat" using 1:9 t "joint8" w l ,\
		 "$1.dat" using 1:10 t "joint9" w l ,\
		 "$1.dat" using 1:11 t "joint10" w l 




EOF


