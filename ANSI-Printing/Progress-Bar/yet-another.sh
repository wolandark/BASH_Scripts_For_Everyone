#!/bin/bash

# Function to draw a progress bar
draw_progress_bar() {
    local width=$1
    local progress=$2

    # Calculate the number of characters to fill based on the progress
    local fill=$((progress * width / 100))

    # Print the progress bar
    printf "["
    printf "%${fill}s" | tr ' ' '='
    printf "%$((width - fill))s"
    printf "] %d%%\r" "$progress"
}

# Example usage
clear  # Clear the terminal screen

# Loop to simulate progress updates
for ((i = 0; i <= 100; i += 10)); do
    draw_progress_bar 50 "$i"
    sleep 1  # Simulate some processing time
done

echo  # Move to the next line after the progress bar

