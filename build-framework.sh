#!/bin/sh

# Step 1. Build Device and Simulator versions on iOS
xcodebuild -project "Test.xcodeproj" -scheme "Test"  -sdk iphonesimulator clean build
xcodebuild -project "Test.xcodeproj" -scheme "Test"  -sdk iphoneos clean build

