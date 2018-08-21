#!/bin/zsh

if pacman -Syu && pacman -S `cat package_list`
then
  echo installed pacman package list
else
  echo failed to install pacman package list
fi
