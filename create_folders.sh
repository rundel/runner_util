#!/bin/bash

START=1
END=4

VERSION=2.308.0
SHA=9f994158d49c5af39f57a65bf1438cbae4968aec1e4fec132dd7992ad57c74fa

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

