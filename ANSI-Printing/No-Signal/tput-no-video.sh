#!/bin/bash

cols=$(tput cols)
lines=$(tput lines)
barwidth=$(( cols / 8 ))
colors=( 47 43 46 42 45 41 44 40 )

drawBarSegment() {
  printf '\033[%dm%*s' "$1" "$barwidth" " "
}

for (( line = 1; line < lines - 1; line++ )); do
  for color in "${colors[@]}"; do
    drawBarSegment $color
  done
  printf '%*s\n' "$(( cols % 8 ))" " " 
done

for color in ${colors[@]}; do
  lastline="$(drawBarSegment $color)$lastline"
done
printf "%s%*s%s\033[m\n" "$lastline" "$(( cols % 8 ))"

