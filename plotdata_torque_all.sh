#!/bin/sh
file_date=$(date '+%Y%m%d')
(
	cd ~/sim_data
	mkdir Auto_${file_date}
	cd Auto_${file_date}
	mkdir data
	mkdir graph
)

for f in * ; do
	Auto_data=$(echo ${f%.*} | egrep Auto_) #Auto_から始まるファイルの拡張子より前の部分をAuto_dataに格納
	if [ -n "${Auto_data}" ]; then	#%{Auto_data}が空でなければ
		echo "${Auto_data}"

		./plotdata_torque.sh ${Auto_data}
		mv torque_${Auto_data}.png ~/sim_data/Auto_${file_date}/graph

		mv ${Auto_data}.dat ~/sim_data/Auto_${file_date}/data
	fi
done

<<comment

comment
