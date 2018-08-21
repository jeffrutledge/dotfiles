#!/bin/zsh

# Setup stow and bin
stow stow
stow bin

for dotpackage in `cat $1`
do
  echo stowing $dotpackage
  if stow_hook $dotpackage
  then
    echo finished stowing $dotpackage
  else
    echo failed to stow $dotpackage
  fi
  echo
done
