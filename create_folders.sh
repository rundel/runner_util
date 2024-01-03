#!/bin/bash

START=1
END=4

VERSION=2.311.0
SHA=29fc8cf2dab4c195bb147384e7e2c94cfd4d4022c793b346a6175435265aa278

curl -o actions-runner-linux-x64.tar.gz -L https://github.com/actions/runner/releases/download/v$VERSION/actions-runner-linux-x64-$VERSION.tar.gz

echo "$SHA actions-runner-linux-x64-$VERSION.tar.gz" | shasum -a 256 -c


for (( i=$START; i<=$END; i++ ))
do
    echo "Creating action-runner$i"
    mkdir "actions-runner$i" && cd "actions-runner$i"

    cp ../actions-runner-linux-x64.tar.gz ./

    tar xzf ./actions-runner-linux-x64.tar.gz
    rm -f actions-runner-linux-x64.tar.gz
    cd ..
done

rm -f action-runner-linux-x64.tar.gz

