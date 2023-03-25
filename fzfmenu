#!/bin/bash

# Written By Woland

# A launcher script that uses fzf as a dmenu replacement

# Dependency:
#          fzf
#          devour

# Usage
#     adjust DIR variables if needed then launch the script

# https://github.com/wolandark
# https://github.com/wolandark/BASH_Scripts_For_Everyone

DIR1="/usr/bin/"
DIR2="/bin/"
DIR3="$HOME/.local/bin/"

Menu="$(find "$DIR1" "$DIR2" "$DIR3" -executable | uniq -u | sort | fzf --prompt=" Run : " --border=rounded --margin=5% --height 100% --reverse --header=" PROGRAMS " --info=hidden --header-first)" 

devour "$Menu"
