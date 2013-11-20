#!/bin/bash

if [[ ! -d ~/.vim/bundle/vundle ]]; then
  echo "Installing vundle"
  mkdir -p ~/.vim/bundle
  git clone https://github.com/gmarik/vundle.git ~/.vim/bundle/vundle
fi
vim +BundleInstall +qall

