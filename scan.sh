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
    echo "Scanning full port range..."
    nmap -sV $scripts -T$speed -p- $targetip | tee scan_result.txt
else
    echo "Scanning common port range..."
    nmap -sV $scripts -T$speed $targetip | tee scan_result.txt
fi