#!/bin/bash
#prompted CLI for dir enum
#echo "Target IP?"
#read target
targetip=$(< ./targetip.txt)
echo "enum (1)dirs or (2)subdomains?"
read modeChoice
#start mode
if [ $modeChoice = 1 ]; then
    #enum dirs
    echo "(s)mall or (m)edium wordlist?"
    read sizeChoice
    listDir="/usr/share/wordlists/dirbuster/"
    if [ "$sizeChoice" = "m" ]; then
        list="directory-list-2.3-medium.txt"
    else
        list="directory-list-2.3-small.txt"
    fi
    listFormat=$listDir$list
    gobuster dir --url $targetip --wordlist $listFormat -x php,html | tee dirbust_result.txt
elif [$modeChoice = 2]; then
    #enum subdomains
    targetURL=$(< ./targeturl.txt)
    gobuster vhost -w /opt/useful/seclists/Discovery/DNS/subdomains-top1million-5000.txt -u $targetURL
fi