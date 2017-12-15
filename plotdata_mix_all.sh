#!/bin/sh
file_date=$(date '+%Y%m%d')
(
	cd ~/sim_data
	mkdir Auto_${file_date}
	cd Auto_${file_date}
	mkdir mix4graph
)

All_name=""
dat=" "

for f in * ; do
	Auto_data=$(echo ${f%.*} | egrep mix4graph) #Auto_から始まるファイルの拡張子より前の部分をAuto_dataに格納
	if [ -n "${Auto_data}" ]; then	#%{Auto_data}が空でなければ
		echo "${Auto_data}"
		All_name=${All_name}${Auto_data}${dat}
		#./plotdata_mix.sh ${Auto_data}
		
		#mv ${Auto_data}.dat ~/sim_data/Auto_${file_date}/mix4graph
	fi
done

echo "${All_name}"

./plotdata_mix_average.sh ${All_name}
./plotdata_mix_max.sh ${All_name}
./plotdata_mix_over10.sh ${All_name}
./plotdata_mix_over50.sh ${All_name}
./plotdata_mix_over100.sh ${All_name}

<<comment

comment
