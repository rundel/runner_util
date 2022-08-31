#/bin/bash

for d in */; do
    cd $d
    ./svc.sh stop
    cd ..
done

