#!/bin/bash
for file in /var/run/qingyou/*.pid
do
    pid=`cat $file`
    if ! kill -0 $pid > /dev/null 2>&1; then
        exit 1
    fi
done
exit 0
