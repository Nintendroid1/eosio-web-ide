#!/bin/bash

# Reset Database
../execute_sql.sh ../delete.sql

# Set up Database
../execute_sql.sh ../create_db.sql
../execute_sql.sh ../create_tables.sql
../execute_sql.sh ../contract.sql

# Insertion
#../execute_sql.sh insert_basic.sql

# Output
