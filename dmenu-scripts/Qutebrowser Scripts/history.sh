#!/bin/bash

# Written By Woland

# Choose Files From Dmenu To Edit In Vim

# Dependency:
#          dmenu
#          Qutebrowser

# https://github.com/wolandark
# https://github.com/wolandark/BASH_Scripts_For_Everyone

db=$HOME/.local/share/qutebrowser/history.sqlite
url=$(sqlite3 "$db" "select url, title, atime from History" | tac | awk -F '|' '{print $1}' | dmenu -l 20)
[ -z "$url" ] && exit
qutebrowser --target window "$url"
