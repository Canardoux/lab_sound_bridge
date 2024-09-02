#!/bin/bash
if [ -z "$1" ]; then
        echo "Correct usage is $0 <Version>"
        exit -1
fi


VERSION=$1
VERSION_CODE=${VERSION//./}
VERSION_CODE=${VERSION_CODE//+/}

git add .
git commit -m "lab_sound-bridge : Version $VERSION"
git pull origin
git push origin
if [ ! -z "$VERSION" ]; then
    git tag -f $VERSION
    git push  -f origin $VERSION
fi

pod trunk push lab_sound_bridge.podspec 
if [ $? -ne 0 ]; then
    echo "Error: trunk push lab_sound_bridge.podspec"
    exit -1
fi
