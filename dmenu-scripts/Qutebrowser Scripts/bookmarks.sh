#!/bin/bash

# Written By Woland

# Choose Files From Dmenu To Edit In Vim

# Dependency:
#          dmenu
#          Qutebrowser

# https://github.com/wolandark
# https://github.com/wolandark/BASH_Scripts_For_Everyone

selected=$(cat /home/woland/.config/qutebrowser/bookmarks/urls | rofi -dmenu )

if [ -z $selected ]; then
    exit 0
else
   qutebrowser "$selected" &&
fi
exit 0
