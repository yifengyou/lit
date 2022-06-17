#!/bin/bash

WORKDIR=`pwd`

if ! which sed ; then
	echo "sed not found!"
	echo " yum install -y sed"
	exit 1
fi

if [ $# -gt 1 ];then
	echo "just need one parameter to specific target dir"
	exit 1
fi

if [ $# -eq 1 ];then
	if [ ! -d $1 ] ; then
		echo " $1 is not useful dir!"
		exit 1
	else
		WORKDIR=$1
	fi
fi

for f in `find $1 -type f`; do
	if file ${f} | grep -i text ; then
		sed -i "s/\t/    /g" ${f}
		echo "tackle: ${f} [$?]"
	fi
done

echo "All done!"
