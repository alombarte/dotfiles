#!/bin/bash
# Usage: Call the script passing the files or pattern you want to convert

for file in $*
do
 # do something on $file
	if [ -f "$file" ]; then
		file_output="clean_$file"
	 	echo "Converting file $file to $file_output"
		#https://gist.github.com/lelandbatey/8677901
		convert "$file" -morphology Convolve DoG:15,100,0 -negate -normalize -blur 0x1 -channel RBG -level 60%,91%,0.1 "$file_output"
	fi
	done
