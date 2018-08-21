#!/bin/sh

if systemctl --now --user enable mail_sync.timer
then
  echo enabled and started mail_sync timer
else
  echo failed to enable mail_sync timer
  exit 1
fi
