#!/bin/bash

## TODO: Replace $SCRIPT_FILE with $1.
# Testing by assigning $1 to match $SCRIPT_FILE below.

## SCRIPT_FILE="your_script.sh" # Replace with your script file
SCRIPT_FILE=$1

# Extract function names
function_names=$(grep -E '^(function )?[a-zA-Z_][a-zA-Z0-9_]*\(\)' "$SCRIPT_FILE" | \
                 sed -E 's/^(function )?([a-zA-Z_][a-zA-Z0-9_]*)\(\).*/\2/')

# Generate Case Statement.
# TODO: Save as separate file ?

echo "case \$1 in"
for func_name in $function_names; do
  echo "  $func_name)"
  echo "    $func_name \"\$@\"" # Call the function with all arguments
  echo "    ;;"
done
echo "  *)"
echo "    echo \"Usage: $0 {$(echo $function_names | sed 's/ /|/g')}\""
echo "    exit 1"
echo "    ;;"
echo "esac"
