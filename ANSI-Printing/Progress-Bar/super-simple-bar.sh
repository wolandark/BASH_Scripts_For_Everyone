#!/bin/bash

# Function to draw a progress bar
draw_progress_bar() {
    local terminal_width=$(tput cols)  # Get the width of the terminal

    # Print the progress bar
    printf "["
    for ((i=0; i<terminal_width; i++)); do
        printf "▇"  # Use a block character to represent progress
        sleep 0.1
    done
    printf "]\n"  # Move to the next line after printing the progress bar
}

# Main
draw_progress_bar

