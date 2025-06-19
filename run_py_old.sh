#!/bin/bash

# === CONFIGURATION ===
SRC_DIR_EX="py-ex"
ENTRY_PREFIX_EXERCISES="ex-"  # Prefix for example files like ex-1.ts
PY_VENV_NAME="advent"

# Activate the Python virtual environment
source $PY_VENV_NAME/bin/activate

# Check if an argument is provided
if [ -z "$1" ]; then
  echo "You must specify an exercise number"
  exit 1
fi

SCRIPT="$SRC_DIR_EX/$ENTRY_PREFIX_EXERCISES$1.py"

# Check if the Python script exists
if [ ! -f "$SCRIPT" ]; then
  echo "Error: File '$SCRIPT' does not exist."
  exit 2
fi

# Run the Python script
python3 "$SCRIPT"


# Deactivate the venv
deactivate
