#!/bin/bash

# Function to draw a filling bar
draw_filling_bar() {
    local progress=$1

    # Print the filling bar
    printf "["
	echo -ne "\033[42m"
    printf "%-${progress}s" | tr ' ' ' '
	echo -ne "\033[0m"   # Reset color
    printf "] %d%%\r" "$progress"
}

# Example usage
clear  # Clear the terminal screen

# Loop to simulate progress updates
for ((i = 0; i <= 100; i += 10)); do
    draw_filling_bar "$i"
    sleep 1  # Simulate some processing time
done

echo  # Move to the next line after the progress bar

