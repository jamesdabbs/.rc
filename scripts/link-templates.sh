#!/bin/bash
ln -sf ~/.rc/templates/ackrc ~/.ackrc
ln -sf ~/.rc/templates/gemrc ~/.gemrc
ln -sf ~/.rc/templates/gitconfig ~/.gitconfig
ln -sf ~/.rc/templates/gitignore_global ~/.gitignore_global
ln -sf ~/.rc/templates/rspec ~/.rspec
ln -sf ~/.rc/templates/tmux.conf ~/.tmux.conf
ln -sf ~/.rc/templates/vimrc ~/.vimrc
ln -sf ~/.rc/templates/zsh_aliases ~/.zsh_aliases

ln -sf ~/.rc/templates/jdabbs.zsh-theme ~/.oh-my-zsh/themes/jdabbs.zsh-theme

mkdir -p ~/.bundle
ln -sf ~/.rc/templates/bundle.config ~/.bundle/config

mkdir -p ~/.vim/colors
ln -sf ~/.rc/templates/tir_black.vim ~/.vim/colors/tir_black.vim

rm -f ~/.zshrc
ln -sf ~/.rc/templates/zshrc ~/.zshrc
touch ~/.zshrc.local

