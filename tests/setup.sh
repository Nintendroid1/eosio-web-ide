#!/bin/bash

for i in {1..100000}
do
    cleos push action hospital.vt clearpat '[hospital.vt]' -p hospital.vt
    cleos push action hospital.vt clearvit '[hospital.vt]' -p hospital.vt
    cleos push action hospital.vt clearem '[hospital.vt]' -p hospital.vt
    cleos push action hospital.vt clearcon '[hospital.vt]' -p hospital.vt
    cleos push action hospital.vt clearall '[hospital.vt]' -p hospital.vt
done
