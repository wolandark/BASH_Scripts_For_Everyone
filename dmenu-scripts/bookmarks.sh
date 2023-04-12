#!/bin/bash
#
selected=$(cat /home/woland/.config/qutebrowser/bookmarks/urls | rofi -dmenu )

if [ -z $selected ]; then
    exit 0
else
   qutebrowser "$selected" &&
fi
exit 0
