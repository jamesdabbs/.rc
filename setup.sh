#!/bin/zsh

echo -n "\n== OH MY ZSH =="
~/.rc/scripts/oh-my-zsh.sh

echo -n "\n== RBENV =="
~/.rc/scripts/rbenv.sh

echo -n "\n== VIM PLUGINS =="
~/.rc/scripts/vim.sh

echo -n "\n== LINKING CONFIG FILES =="
~/.rc/scripts/link-templates.sh

echo -n "\nDone. You should 'source ~/.zshrc' to get started"

