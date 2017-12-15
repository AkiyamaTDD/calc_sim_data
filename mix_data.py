#!/usr/bin/python

import sys

#average
average = [0]*21
torque_max = [0]*21
over10 = [0]*21
over50 = [0]*21
over100 = [0]*21
count = 0

fp = open(sys.argv[1], 'r')
for line in fp.readlines():
	elements = [float(x.strip()) for x in line.split(',')]
	count += 1
	i=int(elements[0])
	average[i] += float(elements[1])
	torque_max[i] += float(elements[2])
	over10[i] += int(elements[3])
	over50[i] += int(elements[4])
	over100[i] += int(elements[5])

i = 1
count = count/20
while i < 21:
	average[i] = average[i]/count
	torque_max[i] = torque_max[i]/count
	over10[i] = over10[i]/count
	over50[i] = over50[i]/count
	over100[i] = over100[i]/count
	i = i + 1

print average
print torque_max
print over10
print over50
print over100

fp.close()

file_name = sys.argv[1]
file_name = file_name[:-4] + '4graph.dat'

fp = open(file_name, 'w')
fp.write('#joint, average, max, over10, over50, over100\n')
i=1
while i < 21:
	fp.write(str(i) + ',' + str(average[i]) + ',' + str(torque_max[i]) + ',' + str(over10[i]) + ',' + str(over50[i]) + ',' + str(over100[i]) + '\n')
	i += 1
fp.close() 
