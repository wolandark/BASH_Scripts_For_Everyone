#!/usr/bin/env bash

# Cross dimensions
cross_width=7
cross_height=10
horizontal_position=2  # How far down the horizontal line should be from the top of the cross

# Initialize terminal settings
init_term() {
    printf '\e[?1049h\e[2J\e[?25l'
    shopt -s checkwinsize
}

# Reset terminal settings
deinit_term() { 
    printf '\e[?1049l\e[?25h'; 
}

# Function to move cursor and print content
move_cursor() {
    printf "\e[%d;%dH" "$1" "$2"
}

# Trap for terminal resize
trap 'clear; draw_cross' WINCH

# Function to draw the cross
draw_cross() {
    clear
    # Recalculate starting positions after resize
    local start_col=$(( (COLUMNS - cross_width) / 2 ))
    local start_row=$(( (LINES - cross_height) / 2 ))

    # Print the cross
    for ((i = 0; i < cross_height; i++)); do
        row=$((start_row + i))

        if ((i == horizontal_position)); then
            # Print horizontal line using a loop for cross_width
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
}

# Main function
main() {
    init_term
    draw_cross
    while :; do  # Keep the script running to allow window resizing to take effect
        sleep 1
    done
}

# Catch EXIT to restore terminal
trap deinit_term EXIT
main
