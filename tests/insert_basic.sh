#!/bin/bash

cleos push action hospital.vt addstaff '[hospital.vt, bob, "8am-5pm", "147 Eastwood", "123-456-7890", "bob_vance@gmail.com"]' -p hospital.vt
cleos push action hospital.vt addpatient '[hospital.vt, jane, "female", "01/01/2020", "123 Street", "555-555-5555", "janeD@gmail.com", "joe", "spouse", "123 Street", "314-159-2653","joeD@gmail.com", bob]' -p hospital.vt -p bob
