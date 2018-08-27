#!/bin/sh

if pacman -Syu && pacman -S `cat _package_list`
then
  echo installed pacman package list
else
  echo failed to install pacman package list
fi
