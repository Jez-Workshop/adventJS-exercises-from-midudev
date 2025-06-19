#!/bin/bash

# Check if an argument is provided
if [ -z "$1" ]; then
  echo "You must specify an exercise number"
  exit 1
fi

make py_run ARGS="$1"
