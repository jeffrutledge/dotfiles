#!/bin/sh

if systemctl --now --user enable emacs.service
then
  echo enabled and started emacs background daemon
else
  echo failed to enable emacs background daemon
  exit 1
fi
