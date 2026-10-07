#!/bin/bash
#prompted CLI for scanning
#echo "Target IP?"
#read targetip
targetip=$(< ./targetip.txt)
#echo "Speed (1-5)?"
#read speed
#echo "(c)ommon or (f)ull port range?"
#read range
echo "(y/n) Run default scripts?"
read scriptChoice
range=f
speed=5
if [ "$scriptChoice" = "y" ]; then
    scripts="-sC"
fi
if [ "$range" = "f" ]; then
    range="-p-"
fi
nmap -sV $scripts -T$speed $range $targetip | tee port_enum.txt