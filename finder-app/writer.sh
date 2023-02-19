#!/bin/sh

set -e
set -u

writefile="sample/sample"
writedir="sample"
writestr="sample"
field=0

if [ $# -lt 2 ]
then
	echo "Usage: $0 var1 var2"
	exit 1
else
	writefile=$1
	writestr=$2
fi

field=$(echo $writefile | awk -F '/' '{print NF}')
writedir=$(echo $writefile | cut -d'/' -f1-$(($field-1)))

if [ -d $writedir ]
then
	echo $writestr > $writefile
else
	mkdir -p $writedir
	echo $writestr > $writefile
fi
