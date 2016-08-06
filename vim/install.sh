#!/bin/sh
#
# vim
#
# This installs vundle

vundledir=~/.vim/bundle/Vundle.vim
if [ ! -d $vundledir ]; then
  echo "  Installing Vundle for you."
  git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
fi

vim +PluginInstall +qall

exit 0
