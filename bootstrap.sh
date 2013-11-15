#!/bin/bash

curl https://raw.github.com/jamesdabbs/.rc/master/ssh-keys.py -o ssh-key.py
mkdir -p $HOME/.ssh
python ssh-key.py
rm ssh-key.py

echo ""
sudo apt-get install -y git zsh

echo ""
echo ""
echo "Pulling configuration scripts from Github"
git clone git@github.com:jamesdabbs/.rc.git $HOME/.rc
$HOME/.rc/setup.sh

