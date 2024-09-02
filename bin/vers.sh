#!/bin/bash
if [ -z "$1" ]; then
        echo "Correct usage is $0 <Version>"
        exit -1
fi


VERSION=$1
VERSION_CODE=${VERSION//./}
VERSION_CODE=${VERSION_CODE//+/}

gsed -i  "s/^\( *s.version *= *\).*$/\1'$VERSION'/"  lab_sound_bridge.podspec
