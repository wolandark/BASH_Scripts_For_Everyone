#!/bin/bash

# Written By Woland

#Automatic wallpaper changer with timer

#Dependency:
#          feh
#          Adjust PIC_DIR variable and point it at your wallpapers directory

# https://github.com/wolandark
# https://github.com/wolandark/BASH_Scripts_For_Everyone

#PATH to wallpapers
PIC_DIR="$HOME/Pictures/Nature/"
PIC_LIST=("$PIC_DIR"*)
# echo "${PIC_LIST[@]}"

#Go through the array and set the wallpapers every 60 seconds
while true
do
  for i in "${PIC_LIST[@]}"
  do
    feh --bg-scale "$i"
    sleep 6
  done
done
