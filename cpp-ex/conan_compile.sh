#!/usr/bin/env bash

set -e  # exit on error
set -u  # error on unset vars

# Load .env file
if [ -f ".env" ]; then
    export $(grep -v '^#' .env | xargs)
else
    echo "⚠️  No .env file found. Please create one with CONAN_BUILD_DIR and CONAN_TOOLCHAIN_DIR."
    exit 1
fi

# Step 1: Install dependencies
echo "🔗 Running Conan install..."
cd $CPP_PROJECT_DIR
conan install . \
    --output-folder="$CONAN_BUILD_DIR" \
    --build=missing

sleep 1
clear

# Step 2: Configure CMake
echo "⚙️  Configuring CMake..."
cmake -B build -S . \
    -DCMAKE_TOOLCHAIN_FILE="$CONAN_BUILD_DIR/$CONAN_TOOLCHAIN_DIR/conan_toolchain.cmake" \
    -DCMAKE_BUILD_TYPE=Release

sleep 2
clear

# Build
echo "🚀 Building..."
cmake --build build

sleep 1
clear

echo "✅ Build complete!"