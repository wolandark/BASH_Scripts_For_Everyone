#!/usr/bin/env bash

cross_width=7
cross_height=10
horizontal_position=2  # How far down the horizontal line should we be from the top of the cross

# Get terminal dimensions
term_width=$(tput cols)
term_height=$(tput lines)

# Calculate the starting position to center the cross
start_col=$(( (term_width - cross_width) / 2 ))
start_row=$(( (term_height - cross_height) / 2 ))

# Hide the cursor and clear the screen
printf "\e[?25l"
clear

# ANSI escape codes to move cursor
move_cursor() {
  printf "\033[%d;%dH" "$1" "$2"
}

# Print the cross
for ((i = 0; i < cross_height; i++)); do
  row=$((start_row + i))
  
  if ((i == horizontal_position)); then
    # Print horizontal line using a loop
    move_cursor $row $start_col
    for ((j = 0; j < cross_width; j++)); do
      printf "█"
    done
  else
    # Print vertical line
    move_cursor $row $((start_col + cross_width / 2))
    printf "█"
  fi
done

# Show the cursor again after printing
printf "\e[?25h\n"

