#!/usr/bin/env bash

# get_fg_color
# echo -e "Your colors are\n\t $FG_COLOR"
# source: https://gist.github.com/blueyed/c8470c2aad3381c33ea3
# modified by Woland

get_color() {
  oldstty=$(stty -g)  # Save current stty settings
  Ps=${1:-11}  # Default to 11 (background color) if no argument

  stty raw -echo min 0 time 0  # Set terminal to raw mode
  printf "\033]$Ps;?\033\\"  # Query terminal for background color

    # Add a minimal sleep to ensure response is captured
    sleep 0.00000001

    read -r answer  # Read terminal response
    result=${answer#*;}  # Strip leading escape characters
    stty $oldstty  # Restore stty settings

    # Remove trailing unwanted characters and export result
    # export _COLOR=$(echo "$result" | sed 's/[^rgb:0-9a-f/]\+$//')
    eval "$2=\$(echo \"\$result\" | sed 's/[^rgb:0-9a-f/]\+\$//')"
}

get_color 10 fg
get_color 11 bg
output_hex_fg="#$(echo "$fg" | sed -E 's/rgb:([0-9a-fA-F]{2})[0-9a-fA-F]{2}\/([0-9a-fA-F]{2})[0-9a-fA-F]{2}\/([0-9a-fA-F]{2})[0-9a-fA-F]{2}/\1\2\3/')"
output_hex_bg="#$(echo "$bg" | sed -E 's/rgb:([0-9a-fA-F]{2})[0-9a-fA-F]{2}\/([0-9a-fA-F]{2})[0-9a-fA-F]{2}\/([0-9a-fA-F]{2})[0-9a-fA-F]{2}/\1\2\3/')"

# echo -e "Your terminal background color is:\n\t $bg"
# echo -e "Your terminal background color is:\n\t $fg"
