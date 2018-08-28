#!/bin/sh

plug=~/.vim/autoload/plug.vim
if [[ ! -a $plug ]]
then
  echo "installing vim-plug."
  curl -fLo $plug --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
fi


echo "installing plug packages."
vim -u None +PlugInstall +qall

echo -e "Compiling YCM."
if [[ ! -e ~/.vim/plugged/YouCompleteMe/install.py ]]
then
  echo "No compile script found for YCM. Check YCM is installed properly."
  exit 1
fi

~/.vim/bundle/YouCompleteMe/install.py --clang-completer --system-libclang
