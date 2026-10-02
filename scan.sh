#!/bin/bash
#prompted CLI for scanning
echo "Target IP?"
read target
echo "Speed (1-5)?"
read speed
echo "(c)ommon or (f)ull port range?"
read range
if [ "$range" = "f" ]; then
    echo "Scanning full port range..."
    nmap -sV -T$speed -p- $target > scan_result.txt
else
    echo "Scanning common port range..."
    nmap -sV -T$speed $target > scan_result.txt
fi