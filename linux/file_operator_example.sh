#!/usr/bin/env bash

########################################################################
# Script Name: file_operator_example.sh
# Purpose: Demonstrates basic file operators in bash
########################################################################

# Assign file name
file="test_file.txt"

# Create a test file
echo "Creating a test file: $file"
echo "This is a sample file for testing file operators." > "$file"

# Check if the file exists
if [ -e "$file" ]; then
  echo "File '$file' exists."
else
  echo "File '$file' does not exist."
fi

# Check if the file is readable
if [ -r "$file" ]; then
  echo "File '$file' is readable."
else
  echo "File '$file' is not readable."
fi

# Check if the file is writable
if [ -w "$file" ]; then
  echo "File '$file' is writable."
else
  echo "File '$file' is not writable."
fi

# Check if the file is executable
if [ -x "$file" ]; then
  echo "File '$file' is executable."
else
  echo "File '$file' is not executable."
fi

# Check if it's a regular file
if [ -f "$file" ]; then
  echo "File '$file' is a regular file."
else
  echo "File '$file' is not a regular file."
fi

# Check if it's a directory
if [ -d "$file" ]; then
  echo "'$file' is a directory."
else
  echo "'$file' is not a directory."
fi

# Clean up: Delete the test file
rm "$file"
echo "Test file '$file' deleted."

########################################################################
# Script Completed
########################################################################
