#!/bin/bash

# Directory containing the files to be renamed
INPUT_DIR="$1"

# Check if the directory is provided
if [ -z "$INPUT_DIR" ]; then
  echo "Usage: $0 <directory>"
  exit 1
fi

# Get the current date in YYYY-MM-DD format
current_date=$(date +"%Y-%m-%d")

# Rename files
for filepath in "$INPUT_DIR"/*; do
  filename=$(basename -- "$filepath")
  extension="${filename##*.}"
  filename_without_ext="${filename%.*}"
  
  # Convert filename to lowercase, replace spaces with hyphens, and append the date
  new_filename="${filename_without_ext,,}"      # Convert to lowercase
  new_filename="${new_filename// /-}"           # Replace spaces with hyphens
  new_filename="${current_date}-${new_filename}.markdown"
  
  mv "$filepath" "$INPUT_DIR/$new_filename"
  echo "Renamed $filename to $new_filename"
done

