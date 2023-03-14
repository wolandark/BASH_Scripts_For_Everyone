#!/bin/bash

# Written By Woland

# Basic fetch script in bash

# https://github.com/wolandark
# https://github.com/wolandark/BASH_Scripts_For_Everyone

# Get system information
OS=$(uname -s)
HOSTNAME=$(uname -n)
KERNEL=$(uname -r)
UPTIME=$(uptime -p | sed 's/up //')
PKG=$(doas pacman -Q | wc -l)

# Get CPU information
CPU=$(grep 'model name' /proc/cpuinfo | head -n1 | awk -F: '{print $2}')
CORES=$(grep 'cpu cores' /proc/cpuinfo | head -n1 | awk -F: '{print $2}')

# Get memory information
MEMORY=$(grep 'MemTotal' /proc/meminfo | awk -F: '{print $2}')

# Get GPU information (if available)
GPU=$(lspci | grep -i vga | awk -F: '{print $3}')

# Print ASCCI art if .face.icon is present, uncomment
# jp2a ~/.face.icon --size=40x20 --colors

# Output the information
echo "OS: $OS"
echo "Hostname: $HOSTNAME"
echo "Kernel: $KERNEL"
echo "Packages: $PKG"
echo "Uptime: $UPTIME"
echo "CPU: $CPU"
echo "CPU cores: $CORES"
echo "Memory: $MEMORY"
echo "GPU: $GPU"
