#!/bin/sh
#
# vim
#
# This compiles ycm

echo -e "\t - compiling YCM."
if [ ! -e ~/.vim/bundle/YouCompleteMe/install.py ]
then
  echo -e "\t\t - no compile script found for YCM."
  echo -e "\t\t - check YCM is installed properly."
  exit 1
fi

~/.vim/bundle/YouCompleteMe/install.py --clang-completer --system-libclang

exit 0
