#!/bin/bash

curl https://raw.github.com/jamesdabbs/.rc/master/ssh-keys.py -o ssh-key.py
python ssh-key.py
git clone git@github.com:jamesdabbs/.rc.git
.rc/setup.sh

