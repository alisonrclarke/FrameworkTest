#!/bin/sh

set -e -u

# Get local directory path
DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
OUTPUTFOLDER=${DIR}/output

git clone https://${GH_TOKEN}@github.com/MrAPolk/TestReleases.git

cd TestReleases

git checkout master

cp -rf "$OUTPUTFOLDER"/* release/

git commit -am 'New release.'

git push origin master

cd "$DIR"

# Creates github release.
./create-release.sh "1.0.3"

rm -rf TestReleases
