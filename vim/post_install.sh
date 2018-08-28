#!/bin/sh

plug=~/.vim/autoload/plug.vim
if [[ ! -a $plug ]]
then
  echo "installing vim-plug."
  curl -fLo $plug --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
fi


echo "installing plug packages."
vim +PlugInstall +qall
