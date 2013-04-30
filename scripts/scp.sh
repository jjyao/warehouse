#!/bin/bash
# advanced scp with support for compression
if [ $# -ne 2 ]; then
    echo "Usage: bash scp.sh /path/to/file user@example.com:/path"
    exit
fi
filename=`basename $1`
host=${2%%:*}
path=${2##*:}
gzip -c $1 | ssh $host "gunzip -c - > $path/$filename"
