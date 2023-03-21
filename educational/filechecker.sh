#!/bin/bash
#
# File Checker
#

filename=$1

if [ -f "$filename" ] && [ -w "$filename" ]
then
	echo "File found!"
	echo "Append some text" >> $filename
else
	echo "File not accessible. Creating:" $filename
	touch $filename
	echo "Append some text" >> $filename
	echo "Process Completed!"
fi
