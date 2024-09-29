#!/bin/bash

# Function to draw a green progress bar
draw_green_progress_bar() {
    local terminal_width=$(tput cols)  # Get the width of the terminal

    # ANSI escape code to set green color
    local green_color=$(tput setaf 2)
    # ANSI escape code to reset color
    local reset_color=$(tput sgr0)

    # Print the green progress bar
    printf "${green_color}["
    for ((i=0; i<terminal_width; i++)); do
        printf "▇"  # Use a block character to represent progress
        sleep 0.1
    done
    printf "]${reset_color}\n"  # Move to the next line after printing the progress bar
}

# Main
draw_green_progress_bar

