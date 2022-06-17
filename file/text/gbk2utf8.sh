#!/bin/bash

WORKDIR=`pwd`

if ! which iconv ; then
	echo "iconv not found!"
	echo " yum install -y glibc-common"
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
		iconv -f gbk -t utf8 ${f} > ${f}.bak
		/usr/bin/mv ${f}.bak ${f}
		echo "iconv ${f} to ${f}.bak ok"
	fi
done

echo "All done!"
