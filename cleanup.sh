#!/bin/bash

# Get the temporary directory path from argument
TEMP_DIR="$1"

if [ -d "$TEMP_DIR" ]; then
  echo "::debug::Cleaning up temporary directory"
  rm -rf "$TEMP_DIR"
fi
