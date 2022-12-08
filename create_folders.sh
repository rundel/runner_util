#!/bin/bash

START=1
END=4

VERSION=2.299.1
SHA=147c14700c6cb997421b9a239c012197f11ea9854cd901ee88ead6fe73a72c74

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

