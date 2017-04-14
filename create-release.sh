#!/bin/sh

set -e -u

version=$1
branch="master"
description="Release of version $version."
repository="TestReleases"
owner="MrAPolk"

data=$(cat <<END
{
    "tag_name": "v$version",
    "target_commitish": "$branch",
    "name": "v$version",
    "body": "$description",
    "draft": false,
    "prerelease": false
}
END
)

curl --data "$data" "https://api.github.com/repos/$owner/$repository/releases?access_token=$GH_TOKEN"

