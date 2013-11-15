#!/bin/zsh

echo "\n == INSTALLING PACKAGES =="
~/.rc/scripts/packages.sh

echo "\n== OH MY ZSH =="
~/.rc/scripts/oh-my-zsh.sh

echo "\n== RBENV =="
~/.rc/scripts/rbenv.sh

echo "\n== VIM PLUGINS =="
~/.rc/scripts/vim.sh

echo "\n== LINKING CONFIG FILES =="
~/.rc/scripts/link-templates.sh

echo "\nDone. You should 'source ~/.zshrc' to get started"

