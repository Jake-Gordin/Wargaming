#!/bin/bash
#prompted CLI for scanning
echo "Target IP?"
read $target
echo "Speed (1-5)?"
read $speed
echo "(c)ommon or (f)ull port range?"
read $range
if [$range -eq f]; then
    echo "chose full"
else
    echo "chose common"
fi