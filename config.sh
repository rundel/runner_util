#/bin/bash

for d in */; do
    cd $d
    ./config.sh --url $1 --token $2
    cd ..
done
