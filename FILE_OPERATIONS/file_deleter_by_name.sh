#!/bin/bash

# Define the path to search in
path_to_search="/path/to/search"

# Use the find command to locate all files with "FabFilter" in their names
find "$path_to_search" -name "*FabFilter*" -type f -print0 |

# Delete each file found
while IFS= read -r -d '' file; do
    echo "Deleting file: $file"
    rm "$file"
done

echo "Done deleting files containing 'FabFilter'"
