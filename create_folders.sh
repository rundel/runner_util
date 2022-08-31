#!/bin/bash

START=1
END=4

VERSION=2.286.1
SHA=7b1509c353ea4e6561b2ed2e916dcbf2a0d8ce21172edd9f8c846a20b6462cd6

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

