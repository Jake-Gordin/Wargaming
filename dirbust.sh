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
    echo "(s)mall or (m)edium search?"
    read sizeChoice
    listDir="/usr/share/wordlists/dirbuster/"
    if [ "$sizeChoice" = "m" ]; then
        list="directory-list-2.3-medium.txt"
    else
        list="directory-list-2.3-small.txt"
    fi
    listFormat=$listDir$list
    gobuster dir --url $targetip --wordlist $listFormat -x php,html | tee dir_enum.txt
elif [ $modeChoice = 2 ]; then
    #enum subdomains
    echo "(s)mall, (m)edium, or (l)arge search?"
    read sizeChoice
    if [ "$sizeChoice" = "m" ]; then
        list="20000.txt"
    elif [ "$sizeChoice" = "l" ]; then
        list="110000.txt"
    else
        list="5000.txt"
    fi
    listDir="/opt/useful/seclists/Discovery/DNS/subdomains-top1million-"
    listFormat=$listDir$list
    targetURL=$(< ./targeturl.txt)
    gobuster vhost -w $listFormat -u $targetURL --append-domain | tee subdomain_enum.txt
fi