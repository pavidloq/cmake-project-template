#!/bin/bash

# Setup dirtories
SCRIPT_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
REPO_ROOT="${SCRIPT_DIR}/../.."
BUILD_DIR="${REPO_ROOT}/build"

# Remake build directory
rm -rf "$BUILD_DIR"
mkdir -p "$BUILD_DIR"
cd "$BUILD_DIR"

# Generate GNU Makefiles using CMake and build it
cmake "$REPO_ROOT" -G "Unix Makefiles"
make editor
