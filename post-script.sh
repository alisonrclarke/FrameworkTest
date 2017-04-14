#!/bin/sh

set -e -u

# Get local directory path
DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

OUTPUTFOLDER=${DIR}/output

# make sure the output directory exists
mkdir -p "$OUTPUTFOLDER"
rm -rf "$OUTPUTFOLDER"/*

# Step 1. Copy the framework structure (from iphoneos build) to the universal folder
cp -R "${BUILD_DIR}/${CONFIGURATION}-iphoneos/${PROJECT_NAME}.framework" "$OUTPUTFOLDER"

# Step 2. Create universal binary file using lipo and place the combined executable in the copied framework directory
lipo -create -output "$OUTPUTFOLDER/${PROJECT_NAME}.framework/${PROJECT_NAME}" "${BUILD_DIR}/${CONFIGURATION}-iphonesimulator/${PROJECT_NAME}.framework/${PROJECT_NAME}" "${BUILD_DIR}/${CONFIGURATION}-iphoneos/${PROJECT_NAME}.framework/${PROJECT_NAME}"

git clone https://${GH_TOKEN}@github.com/MrAPolk/TestReleases.git

cd TestReleases

git co master

mkdir release

cp -rf "$OUTPUTFOLDER"/* release/

git add .

git ci -m 'New release.'

git push origin master

# Creates github release.
./create-release "1.0.3"

rm -rf TestReleases

