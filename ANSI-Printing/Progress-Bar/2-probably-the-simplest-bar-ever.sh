#!/bin/bash

# Function to get the terminal width
get_terminal_width() {
    tput cols
}

# Function to draw a filling bar
draw_filling_bar() {
    local progress=$1
    local terminal_width=$(get_terminal_width)

    # Calculate the width of the filling bar
    local filling_width=$((terminal_width - 10))  # Subtracting 10 for other characters in the progress bar

    # Calculate the number of characters to fill based on the progress
    local fill=$((progress * filling_width / 100))

	# hide cursor 
	printf '\033[?25l'
    # Print the filling bar
    printf "["
    echo -ne "\033[42m"
    printf "%-${fill}s" | tr ' ' ' '
    echo -ne "\033[0m"   # Reset color
    printf "%$((filling_width - fill))s"
    printf "] %d%%\r" "$progress"
}

# Example usage
clear  # Clear the terminal screen

# Loop to simulate progress updates
for ((i = 0; i <= 100; i += 10)); do
    draw_filling_bar "$i"
    sleep 1  # Simulate some processing time
done

# bring back cursor 
printf '\033[?25h'
echo  # Move to the next line after the progress bar

