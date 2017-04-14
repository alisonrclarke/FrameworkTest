#!/bin/sh

set -e -u

if [ -d "${BUILD_DIR}/${CONFIGURATION}-iphonesimulator/${PROJECT_NAME}.framework" ] && [ -d "${BUILD_DIR}/${CONFIGURATION}-iphoneos/${PROJECT_NAME}.framework" ]; then
echo "TEST"
# Get local directory path
DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
OUTPUTFOLDER=${DIR}/output

# make sure the output directory exists
mkdir -p "$OUTPUTFOLDER"
rm -rf "$OUTPUTFOLDER"/*

# Step 1. Copy the framework structure (from iphoneos build) to the universal folder
cp -R "${BUILD_DIR}/${CONFIGURATION}-iphonesimulator/${PROJECT_NAME}.framework" "$OUTPUTFOLDER"

# Step 2. Create universal binary file using lipo and place the combined executable in the copied framework directory
lipo -create -output "$OUTPUTFOLDER/${PROJECT_NAME}.framework/${PROJECT_NAME}" "${BUILD_DIR}/${CONFIGURATION}-iphonesimulator/${PROJECT_NAME}.framework/${PROJECT_NAME}" "${BUILD_DIR}/${CONFIGURATION}-iphoneos/${PROJECT_NAME}.framework/${PROJECT_NAME}"

fi

