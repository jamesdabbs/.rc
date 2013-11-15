#!/bin/bash
ln -s ~/.rc/templates/ackrc ~/.ackrc
ln -s ~/.rc/templates/gemrc ~/.gemrc
ln -s ~/.rc/templates/gitconfig ~/.gitconfig
ln -s ~/.rc/templates/gitignore_global ~/.gitignore_global
ln -s ~/.rc/templates/rspec ~/.rspec
ln -s ~/.rc/templates/tmux.conf ~/tmux.conf
ln -s ~/.rc/templates/vimrc ~/.vimrc
ln -s ~/.rc/templates/zsh_aliases ~/.zsh_aliases

rm ~/.zshrc
ln -s ~/.rc/templates/zshrc ~/.zshrc
touch ~/.zshrc.local

