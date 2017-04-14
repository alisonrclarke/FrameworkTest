#!/bin/sh

set -e -u

# Get local directory path
DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
OUTPUTFOLDER=${DIR}/output

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
