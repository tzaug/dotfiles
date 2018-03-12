#!/bin/bash
set -u

cd $HOME

DOT_FILES=( .vimrc .gitignore )

for file in ${DOT_FILES[@]}
do
  [ ! -e $file ] && ln -s ~/dotfiles/$file ~/$file
done

