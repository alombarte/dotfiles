#!/bin/bash
# Usage: Call the script passing the files or pattern you want to convert
# E.g: whiteBoardClean.sh ~/photos/*.jpg

for file in "$@"
do
 # do something on $file
	if [ -f "$file" ]; then
		ext="${file##*.}"
		filename="${file%.*}"
		file_output="${filename}_clean.${ext}"
	 	echo "Converting file $file to $file_output"
		#https://gist.github.com/lelandbatey/8677901
		convert "$file" -morphology Convolve DoG:15,100,0 -negate -normalize -blur 0x1 -channel RBG -level 60%,91%,0.1 "$file_output"
	else
		echo "Skipping $file, not a file"
	fi
done
