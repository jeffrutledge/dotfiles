#!/bin/sh

if systemctl --now --user enable lowbat_hibernate.timer
then
  echo enabled and started lowbat_hibernate.timer
else
  echo failed to enable lowbat_hibernate.timer
  exit 1
fi
