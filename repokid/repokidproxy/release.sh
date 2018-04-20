#!/bin/bash

set -e	

VERSION=$1
DESCRIPTION=$2
TOKEN=$3
ASSET=$4

echo ${VERSION}
echo ${DESCRIPTION}
RELEASE_ID=`curl -d '{"tag_name": "'"$VERSION"'", "target_commitish": "master", "name": "'"$VERSION"'", "body": "'"$DESCRIPTION"'", "draft": false, "prerelease": false }' -H "Authorization: token $TOKEN" -X POST https://api.github.com/repos/larse514/iaminspector/releases | jq '.id'`
echo ${RELEASE_ID}
curl -d '{}' -H "Authorization: token $TOKEN" -H "Content-Type: application/zip" -X POST "https://uploads.github.com/repos/larse514/iaminspector/releases/${RELEASE_ID}/assets?name=$ASSET"