#!/bin/sh
#
# vim
#
# This installs vundle and vundle's packages

echo -e "\t - installing vundle."
echo -e "\t - installing vundle packages."
exit 0

vundledir=~/.vim/bundle/Vundle.vim
if [! -d $vundledir ]
then
  echo -e "\t - installing vundle."
  git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
fi

echo -e "\t - installing vundle packages."
vim +PluginInstall +qall

exit 0
