#!/bin/bash

# Function to draw a green progress bar
draw_green_progress_bar() {
    local terminal_width=$(tput cols)  # Get the width of the terminal

    #set green color
    local green_color=$(tput setaf 2)
    #reset color
    local reset_color=$(tput sgr0)

    # Print the green progress bar
    # tput sc  # Save cursor position
    # tput cup 0 0  # Move cursor to the beginning of the line

    # Print the progress bar
    echo -n "${green_color}["
    for ((i=0; i<terminal_width - 2; i++)); do
        echo -n "▇"  # Use a block character to represent progress
        sleep 0
    done
     echo -n "]
    ${reset_color}"  # Move to the next line after printing the progress bar
    # tput rc  # Restore saved cursor position
    echo -e "\nDone!"

}

# Main
draw_green_progress_bar

