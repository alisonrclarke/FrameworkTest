#!/bin/sh

# Step 1. Build Device and Simulator versions on iOS
xcodebuild -project "Test.xcodeproj" -scheme "Test"  -sdk iphonesimulator TEST_FRAMEWORK_VERSION="$TEST_FRAMEWORK_VERSION" clean build
xcodebuild -project "Test.xcodeproj" -scheme "Test"  -sdk iphoneos TEST_FRAMEWORK_VERSION="$TEST_FRAMEWORK_VERSION" clean build

