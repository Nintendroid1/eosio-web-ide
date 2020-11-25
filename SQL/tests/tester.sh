#!/bin/bash

for i in {1..10}
do
        ./setup.sh
        ../execute_sql.sh staff.sql
        ( time ../execute_sql.sh insert_large.sql) >> output.txt 2>&1
done
