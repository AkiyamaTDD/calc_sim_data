#!/bin/sh
file_date=$(date '+%Y%m%d')
(
	cd ~/sim_data
	mkdir Auto_${file_date}
	cd Auto_${file_date}
	mkdir data_org
)

for f in * ; do
	Auto_data=$(echo ${f%.*} | egrep Auto_ | egrep -v fixed) #Auto_から始まるかつfixedを含まないファイルの拡張子より前の部分をAuto_dataに格納
	if [ -n "${Auto_data}" ]; then	#${Auto_data}が空でなければ
		echo "${Auto_data}"
		./proseccing_duplication.py ${Auto_data}.dat
		mv ${Auto_data}.dat ~/sim_data/Auto_${file_date}/data_org
	fi
done

<<comment

comment
