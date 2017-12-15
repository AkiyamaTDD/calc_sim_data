#!/usr/bin/python

import sys

total = [0]*21
average = [0]*21
torque_max = [0]*21
over10 = [0]*21
over50 = [0]*21
over100 = [0]*21
count = 0

fp = open(sys.argv[1], 'r')
for line in fp.readlines():
	elements = [float(x.strip()) for x in line.split(',')]
	count = count + 1
	for i, element in enumerate(elements):
		total[i] = total[i] + abs(element)
		if abs(element) > torque_max[i]:
			torque_max[i] = abs(element)
		if abs(element) >= 10:
			over10[i] += 1
			if abs(element) >= 50:
				over50[i] += 1
				if abs(element) >= 100:
					over100[i] += 1 

i = 0
while i < 21:
	average[i] = total[i]/count
	i = i + 1

print total
print average
print torque_max
print over10
print over50
print over100

fp.close()

file_name = sys.argv[1]
file_name = file_name[5:20]
file_name_m = file_name[:-8]
file_name = file_name + '_analyzed.dat'
file_name_m = file_name_m + '_mix.dat'
#only English
#for mixed data
fpm = open(file_name_m, 'a')

fp = open(file_name, 'w')
fp.write('#joint, average, max, over10, over50, over100\n')
i=1
while i < 21:
	fp.write(str(i) + ',' + str(average[i]) + ',' + str(torque_max[i]) + ',' + str(over10[i]) + ',' + str(over50[i]) + ',' + str(over100[i]) + '\n')
	fpm.write(str(i) + ',' + str(average[i]) + ',' + str(torque_max[i]) + ',' + str(over10[i]) + ',' + str(over50[i]) + ',' + str(over100[i]) + '\n')
	i += 1
fp.close() 
fpm.close()
