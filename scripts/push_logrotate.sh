#!/bin/bash
# script for gzip and rotate logs of LightMail push service
# enable bash extended globbing
shopt -s extglob
for file in `ls imap.+([0-9]).log`
do
    regex="^imap\.([0-9]+)\.log"
    [[ $file =~ $regex ]]
    did="${BASH_REMATCH[1]}"
    count=`ls -l imap.$did.log.+([0-9]) | wc -l`
    if [ $count -ne 0 ]; then
        for rotated_gz_file in `ls imap.$did.log.*.gz | sort -Vr`
        do
            regex="^imap\.$did\.log\.([0-9]+)\.gz"
            [[ $rotated_gz_file =~ $regex ]]
            number="${BASH_REMATCH[1]}"
            mv "imap.$did.log.$number.gz" "imap.$did.log.$(($number+$count)).gz"
        done
        for rotated_file in `ls imap.$did.log.+([0-9])`
        do
            gzip $rotated_file
        done
    fi
done
