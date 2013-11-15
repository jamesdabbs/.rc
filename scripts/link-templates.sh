#!/bin/bash
ln -s ~/.rc/templates/ackrc ~/.ackrc
ln -s ~/.rc/templates/gemrc ~/.gemrc
ln -s ~/.rc/templates/gitconfig ~/.gitconfig
ln -s ~/.rc/templates/gitignore_global ~/.gitignore_global
ln -s ~/.rc/templates/rspec ~/.rspec
ln -s ~/.rc/templates/tmux.conf ~/tmux.conf
ln -s ~/.rc/templates/vimrc ~/.vimrc
ln -s ~/.rc/templates/zsh_aliases ~/.zsh_aliases

ln -s ~/.rc/templates/jdabbs.zsh-theme ~/.oh-my-zsh/themes/jdabbs.zsh-theme

mkdir -p ~/.vim/colors
ln -s ~/.rc/templates/tir_black.vim ~/.vim/colors/tir_black.vim

rm -f ~/.zshrc
ln -s ~/.rc/templates/zshrc ~/.zshrc
touch ~/.zshrc.local

