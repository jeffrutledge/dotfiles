#!/bin/zsh

$stow_dotpackage=./bin/bin/stow_dotpackage

echo setting up stow
if stow stow
then
  echo finished setting up stow

  for dotpackage in `cat $1`
  do
    echo stowing $dotpackage
    if $stow_dotpackage $dotpackage
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
