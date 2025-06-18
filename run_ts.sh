#!/bin/bash

# === CONFIGURATION ===
ROOT_DIR="node-ex"
SRC_DIR_EX="src/examples"
DIST_DIR="dist"
ENTRY_PREFIX_EXERCISES="ex-"  # Prefix for example files like ex-1.ts


# === INPUT ARGUMENT VALIDATION ===
if [ -z "$1" ]; then
    echo "You must specify an exercise number"
    exit 1
fi

EX_NAME=$ENTRY_PREFIX_EXERCISES$1
SRC_FILE="$ROOT_DIR/$SRC_DIR_EX/$EX_NAME.ts"

# === CHECK IF SOURCE FILE EXISTS ===
if [ ! -f "$SRC_FILE" ]; then
    echo "Error: Source file $SRC_FILE does not exist."
    exit 1
fi


# === COMPILE TYPESCRIPT FILE ===
echo "Compiling $SRC_FILE ..."

cd "$ROOT_DIR" || exit 1
npx tsc

echo "File $SRC_FILE Compiled..."


# === RUN COMPILED JS FILE ===
DIST_FILE_PATH="$DIST_DIR/$SRC_DIR_EX/$EX_NAME.js"

if [ -f "$DIST_FILE_PATH" ]; then
    echo "Running $ROOT_DIR/$DIST_FILE_PATH..."
    echo -e "\n\n"
    node "$DIST_FILE_PATH"
else
    echo "Error: Compiled file $ROOT_DIR/$DIST_FILE_PATH not found."
    exit 1
fi

