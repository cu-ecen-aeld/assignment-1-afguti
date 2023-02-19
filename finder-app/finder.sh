#!/bin/sh

set -e
set -u

filedir="sample/sample"
searchstr="sample"
X=0
Y=0

if [ $# -lt 2 ] 
then
	echo "Usage: $0 var1 var2"
	exit 1
else
	filedir=$1
	searchstr=$2	
fi

if [ -d $filedir ]
then
	#echo "Directory is: $filedir"
	X=$(grep -l -r $searchstr $filedir | wc -l)
	Y=$(grep -r $searchstr $filedir | wc -l)
	echo "The number of files are $X and the number of matching lines are $Y."
else
	echo "$filedir does not represent a directory."
	exit 1
fi
