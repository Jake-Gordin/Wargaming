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
    $range = "-p-"
else
    echo "Scanning common port range..."
    $range = ""
fi
nmap -sV -T$speed $range $target > scan_result.txt
