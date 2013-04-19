#!/bin/bash
# check input
if [ $# -ne 1 ]; then
    echo "Usage: sh logrotate.sh basename"
    exit
fi

basename=$1
regex="^$basename\.([0-9]+)\.gz"
for file in `ls $basename.*.gz | sort -Vr`
do
    [[ $file =~ $regex ]]
    number="${BASH_REMATCH[1]}"
    mv "$basename.$number.gz" "$basename.$(($number+1)).gz"
done
