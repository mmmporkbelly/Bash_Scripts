#!/bin/bash
# Shows my first interactions with booleans

# Tests to see if arg is set

if [ -z $1 ]
then
	echo Please provide a filename:
	read FILENAME
else
	FILENAME=$1
fi

echo The following filename was provided: $FILENAME
