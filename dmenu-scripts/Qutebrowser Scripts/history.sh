#!/bin/sh

db=$HOME/.local/share/qutebrowser/history.sqlite
url=$(sqlite3 "$db" "select url, title, atime from History" | tac | awk -F '|' '{print $1}' | dmenu -l 20)
[ -z "$url" ] && exit
qutebrowser --target window "$url"
