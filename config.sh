#/bin/bash

for d in */; do
    cd $d
    ./config.sh --unattended --url $1 --token $2 --name $d
    cd ..
done
