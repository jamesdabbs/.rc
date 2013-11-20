#!/bin/bash

# Pathogen
if [[ ! -f ~/.vim/autoload/pathogen.vim ]]; then
  echo "  --> Installing Pathogen"
  mkdir -p ~/.vim/autoload ~/.vim/bundle
  curl -Sso ~/.vim/autoload/pathogen.vim https://raw.github.com/tpope/vim-pathogen/master/autoload/pathogen.vim
fi

# Plugins
plugins=( mileszs/ack.vim kien/ctrlp.vim scrooloose/nerdtree airblade/vim-gitgutter tpope/vim-fugitive )
for repo in "${plugins[@]}"
do
  name=${repo#*/}
  path=$HOME/.vim/bundle/${name}

  echo -n "$repo --> "
  if [[ -d $path ]]; then
    cd $path && git pull >/dev/null
    echo "Updated"
  else
    echo "Cloning"
    cd $HOME/.vim/bundle && git clone git://github.com/$repo >/dev/null
  fi
done

