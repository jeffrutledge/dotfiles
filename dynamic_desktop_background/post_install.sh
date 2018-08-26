#!/bin/sh

if systemctl --now --user enable update_desktop_bg_weather.timer
then
  echo enabled and started update_desktop_bg_weather timer
else
  echo failed to enable update_desktop_bg_weather timer
  exit 1
fi
