#!/bin/bash

# Initialize the progress bar
BAR="|"
TERM_WIDTH=$(tput cols)
# Loop to increment the progress bar
for (( i=0; i<$TERM_WIDTH; i++ )); do
    # Print the current progress bar
    echo -ne "\r$BAR"
    # Append another pipe character to the progress bar
    BAR+="|"
    # Add a short delay to simulate progress
    sleep 0.1
done

# Print a newline character at the end
echo
