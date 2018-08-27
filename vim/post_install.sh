#!/bin/sh

vundledir=~/.vim/bundle/Vundle.vim
if [! -d $vundledir ]
then
  echo "installing vundle."
  git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
fi

echo "installing vundle packages."
vim +PluginInstall +qall

echo -e "Compiling YCM."
if [ ! -e ~/.vim/bundle/YouCompleteMe/install.py ]
then
  echo "No compile script found for YCM. Check YCM is installed properly."
  exit 1
fi

~/.vim/bundle/YouCompleteMe/install.py --clang-completer --system-libclang
