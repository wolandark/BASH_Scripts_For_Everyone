#!/bin/bash

# Written By Woland

# Simple scoreboard

# https://github.com/wolandark
# https://github.com/wolandark/BASH_Scripts_For_Everyone

# Initialize score variables
A=0
B=0

# Main loop
while true; do
    # Print score board
    echo "A: $PLAYER1_SCORE"
    echo "B: $PLAYER2_SCORE"

    # Get player input
    read -rp "Enter player name and score " PLAYER_NAME SCORE
    echo ''
    # Update score
    if [ "$PLAYER_NAME" = "A" ]; then
        PLAYER1_SCORE=$((PLAYER1_SCORE + SCORE))
    elif [ "$PLAYER_NAME" = "B" ]; then
        PLAYER2_SCORE=$((PLAYER2_SCORE + SCORE))
    else
        echo "Invalid player name"
    fi
done
