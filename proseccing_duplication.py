#!/usr/bin/python

import sys

pre_time = 0.0
title = sys.argv[1]
title = title[:-4]
title = title + '_fixed.dat'
raw = ""

fp = open(sys.argv[1], 'r')
fpw = open(title, 'w')
for line in fp.readlines():
	elements = [float(x.strip()) for x in line.split(',')]
	if elements[0] != pre_time:
		for i, element in enumerate(elements):
			raw = raw + str(element) + ','
		raw = raw[:-1]		
		fpw.write(raw + '\n')
	raw = ""	
	pre_time = elements[0]

fp.close() 
fpw.close()
