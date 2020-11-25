#!/bin/bash

strace -f eosio-cpp contract/patient.cpp

cleos create account eosio hospital.vt EOS6MRyAjQq8ud7hVNYcfnVPJqcVpscN5So8BhtHuGYqET5GDW5CV
cleos set code hospital.vt patient.wasm
cleos set abi hospital.vt patient.abi

