#!/bin/sh

# Step 1. Build Device and Simulator versions on iOS
xcodebuild -project "${PROJECT_NAME}.xcodeproj" -scheme "${PROJECT_NAME}"  -sdk iphonesimulator -destination 'platform=iOS Simulator,name=iPhone 6' clean build
#xcodebuild -scheme "${PROJECT_NAME}" -sdk iphoneos clean build

