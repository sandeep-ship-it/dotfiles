#!/bin/bash

file_list="configFileList"

# Check if the file list exists
if [ ! -f "$file_list" ]; then
    echo "File $file_list does not exist."
    exit 1
fi

# Get the user's home directory
home_dir="$HOME"
pwd="$PWD"

# Read the file list line by line
while  IFS= read -r file; do
    # Check if the file exists
    if [ -f "$file" ]; then
        # Get the basename of the file
        base_name=$(basename "$file")
        # Create a symbolic link in the home directory
        ln -s -f "$pwd/$base_name" "$home_dir/$base_name" 
        echo "Created symlink for $file in $home_dir"
    else
        echo "File $file does not exist."
    fi
done < "$file_list"
