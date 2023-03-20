#!/bin/bash
#
# This script copies all of the files provided as arguments to the home directory
# If no arguments are provided, will use read to ask for file names

if [[ -z $1 ]]
then
	echo Please provide the filepaths of the documents you would like to copy to the home dir
	read INPUT
	cp $INPUT $HOME
else
	for ARG in $@
	do
		cp $ARG $HOME
	done
fi

