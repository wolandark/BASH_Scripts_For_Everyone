#!/bin/bash

# Written By Woland

# Find files by name and copy them to a directory

# https://github.com/wolandark
# https://github.com/wolandark/BASH_Scripts_For_Everyone

# Destination directory in home
DEST_DIR=~/FOUNDFILES

# Create the destination directory if it doesn't already exist
mkdir -p $DEST_DIR

# Read the list of .so files from the file so_list
while read file_list; do

  # Search for the file in 
 SEARCH_RESULT=$(find ~/Scripts/BASH_Scripts_For_Everyone/ -name $file_list)

  # If the file was found, copy it to the destination directory
  if [ -n "$SEARCH_RESULT" ]; then
    cp $SEARCH_RESULT $DEST_DIR
    echo "Copied $file_list to $DEST_DIR"
  else
    echo "$file_list not found in $SEARCH_RESULT"
  fi
done < file_list
