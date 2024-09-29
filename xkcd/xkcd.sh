#!/usr/bin/env bash 

# xkcdsh
# info: 
# 		grabs the latest xkcd comic and displays it with sixel graphics
# Written By Wolandark
# https://www.github.com/wolandark
# Dependency:
# 		libsixel
# 		curl
# 		GNU sed
# 		GNU Grep

curl -s https://xkcd.com | grep -oP '(?<=<img src="//imgs.xkcd.com/comics/)[^"]*' | \
	sed 's/^/https:\/\/imgs.xkcd.com\/comics\//' | \
	while read -r url; do
		filename=$(basename "$url")
		curl -so "$filename" "$url" && img2sixel "$filename"
		printf '%s\n' "$filename"
	done
