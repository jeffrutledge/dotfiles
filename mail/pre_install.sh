#!/bin/zsh

if mkdir -p ~/.mail/hmc && mkdir -p ~/.mail/personal
then
  echo setup isync directories
else
  echo failed to setup isync directories
  exit 1
fi
