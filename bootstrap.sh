#!/bin/bash

curl https://raw.github.com/jamesdabbs/.rc/master/ssh-keys.py -o ssh-key.py
mkdir -p $HOME/.ssh
python ssh-key.py

echo "\n\nPulling configuration scripts from Github"
git clone git@github.com:jamesdabbs/.rc.git $HOME/.rc
$HOME/.rc/setup.sh

