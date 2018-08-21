#!/bin/zsh

$stow_hook=./bin/bin/stow_hook

echo setting up stow and bin
if stow stow && stow bin
then
  echo finished setting up stow and bin

  for dotpackage in `cat $1`
  do
    echo stowing $dotpackage
    if $stow_hook $dotpackage
    then
      echo finished stowing $dotpackage
    else
      echo failed to stow $dotpackage
    fi
    echo
  done
else
  echo failed to setup stow
fi
