#!/bin/bash
#
selected=$(cat /home/woland/.config/qutebrowser/quickmarks | sed 's/.*\(https:\/\/.*\)/\1/' | rofi -dmenu )

if [ -z $selected ]; then
    exit 0
else
    qutebrowser $selected &
fi
