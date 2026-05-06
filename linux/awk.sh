#!/usr/bin/env bash

# Define a string
text="apple banana orange"

# Use awk to check if the word contains 'apple' using regex
echo "$text" | awk '/apple/ {print "Found apple"}'
