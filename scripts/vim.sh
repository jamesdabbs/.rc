#!/bin/bash

# Pathogen
mkdir -p ~/.vim/autoload ~/.vim/bundle
curl -Sso ~/.vim/autoload/pathogen.vim https://raw.github.com/tpope/vim-pathogen/master/autoload/pathogen.vim

# Plugins
git clone https://github.com/mileszs/ack.vim.git ~/.vim/bundle/ack.vim
git clone https://github.com/kien/ctrlp.vim.git ~/.vim/bundle/ctrlp.vim
git clone https://github.com/scrooloose/nerdtree.git ~/.vim/bundle/nerdtree
git clone git://github.com/airblade/vim-gitgutter.git ~/.vim/bundle/vim-gitgutter

