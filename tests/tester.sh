#!/bin/bash

for i in {1..10}
do
        ( time ./insert_large.sh) >> output.txt 2>&1
done
