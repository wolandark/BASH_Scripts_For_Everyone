#!/bin/bash

# Define the path to search in
path_to_search="/home/woland/.wine/drive_c/Program Files/Steinberg/VSTPlugins/FabFilter/"

# Use the find command to locate all files with .so extension
find "$path_to_search" -name "*.so" -type f -print0 |

# Delete each file found
while IFS= read -r -d '' file; do
    echo "Deleting file: $file"
    rm "$file"
done

echo "Done deleting .so files"
