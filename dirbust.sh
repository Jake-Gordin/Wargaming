#!/bin/bash
#prompted CLI for dir enum
echo "Target IP?"
read target
echo "(s)mall or (m)edium wordlist?"
read sizeChoice
listDir="/usr/share/wordlists/dirbuster/"
if [ "$sizeChoice" = "m" ]; then
    list="directory-list-2.3-medium.txt"
else
    list="directory-list-2.3-small.txt"
fi
listFormat=$listDir$list
gobuster dir --url $target --wordlist $listFormat -x php,html | tee dirbust_result.txt