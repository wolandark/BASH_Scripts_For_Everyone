#!/bin/bash

# Written By Woland

# Delete all matching files by name

# https://github.com/wolandark
# https://github.com/wolandark/BASH_Scripts_For_Everyone

# Define the path to search in
path_to_search="$HOME/Downloads/"

# Use the find command to locate all files with "FabFilter" in their names
find "$path_to_search" -name "*FabFilter*" -type f -print0 |

# Delete each file found
while IFS= read -r -d '' file; do
    echo "Deleting file: $file"
    rm "$file"
done

echo "Done deleting files containing 'FabFilter'"
