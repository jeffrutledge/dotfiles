#!/bin/sh

if systemctl --now --user enable duplicati.service
then
  echo enabled and started duplicati.service
else
  echo failed to enable duplicati.service
  exit 1
fi
