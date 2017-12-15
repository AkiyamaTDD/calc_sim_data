#!/bin/sh
file_date=$(date '+%Y%m%d')
(
	cd ~/sim_data
	mkdir Auto_${file_date}
	cd Auto_${file_date}
)

for f in * ; do
	Auto_data=$(echo ${f%.*} | egrep Auto_ | grep fixed) #Auto_から始まるかつfixedを含まないファイルの拡張子より前の部分をAuto_dataに格納
	if [ -n "${Auto_data}" ]; then	#${Auto_data}が空でなければ
		echo "${Auto_data}"
		./analysis_torque.py ${Auto_data}.dat
		#Auto_data=$(echo ${Auto_data%
	fi
done

<<comment

comment
