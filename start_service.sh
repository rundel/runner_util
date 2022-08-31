#/bin/bash

for d in */; do
    cd $d
    ./svc.sh install
    ./svc.sh start
    cd ..
done

