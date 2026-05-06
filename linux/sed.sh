#!/usr/bin/env bash

# Define a string
text="HelloWorld"

# Replace 'World' with 'Bash' using sed with regex
echo "$text" | sed -r 's/World/Bash/'
