#!/bin/bash
if [ -z "$1" ]; then
        echo "Correct usage is $0 <Version>"
        exit -1
fi


VERSION=$1
VERSION_CODE=${VERSION//./}
VERSION_CODE=${VERSION_CODE//+/}

bin/vers.sh $VERSION
bin/reldev.sh REL

rm -r build-ios/*
tools/build_ios.sh
if [ $? -ne 0 ]; then
    echo "Error: tools/build_ios.sh"
    exit -1
fi

bin/pub-ios.sh $VERSION
if [ $? -ne 0 ]; then
    echo "Error: bin/pub-ios.sh"
    exit -1
fi
exit 0 #!!!!!!!!!
rm -r build-ios/*

echo "E.O.J"