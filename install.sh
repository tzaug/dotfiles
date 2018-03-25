#!/bin/bash
set -u

cd $HOME

# installing vim-plug
curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

DOT_FILES=( .vimrc .gitignore )

for file in ${DOT_FILES[@]}
do
  [ ! -e $file ] && ln -s ~/dotfiles/$file ~/$file
done

