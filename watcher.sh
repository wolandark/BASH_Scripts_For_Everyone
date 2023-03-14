#!/bin/bash

# Written By Woland

# Simple resource watcher script
# Needs improvement in the Network section

# https://github.com/wolandark
# https://github.com/wolandark/BASH_Scripts_For_Everyone

while true; do
    echo "Memory Usage: $(free -m | awk 'NR==2{printf "%.2f%%\t\t", $3*100/$2 }')"
    echo "CPU Usage: $(top -bn1 | grep load | awk '{printf "%.2f%%\t\t\n", $(NF-2)}')"
    echo "Temperature: $(cat /sys/class/thermal/thermal_zone0/temp | awk '{printf "%.2f C\t\t", $1/1000}')"
    echo "Network Usage: $(ifstat -i wlan0 -b 2> /dev/null | awk 'NR==3{printf "%.2fMB/s\t\t", $5/1024/1024}')"
    echo "Network Usage: $(ifstat wlan0 -b 2> /dev/null | awk 'NR==3{printf "Download:%.2fMbps\tUpload:%.2fMbps\t", $2*8/1024/1024, $3*8/1024/1024}')"
    echo ''
    sleep 1
done
