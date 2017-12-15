#!/bin/sh
file_date=$(date '+%Y%m%d')
(
	cd ~/sim_data
	mkdir Auto_${file_date}
	cd Auto_${file_date}
	mkdir mix
)

for f in * ; do
	Auto_data=$(echo ${f%.*} | egrep 0_mix | egrep -v 4graph) #Auto_から始まるファイルの拡張子より前の部分をAuto_dataに格納
	if [ -n "${Auto_data}" ]; then	#%{Auto_data}が空でなければ
		echo "${Auto_data}"

		./mix_data.py ${Auto_data}.dat
		mv ${Auto_data}.dat ~/sim_data/Auto_${file_date}/mix
	fi
done

<<comment

comment
