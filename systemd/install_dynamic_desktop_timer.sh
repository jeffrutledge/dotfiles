#!/bin/sh
#
# systemd
#
# This enables a timer that calls python script to update desktop to local weather


if [ -f ~/safe/personal/developer/python/dynamic_desktop_background/update_desktop_bg_to_weather.py ]
then
  echo -e "\t - enabling dynamic desktop timer."
  sudo cp ./update_desktop_bg_weather@.service /etc/systemd/system/
  sudo cp ./update_desktop_bg_weather@.timer /etc/systemd/system/
  sudo systemctl enable update_desktop_bg_weather@$USER.timer
  sudo systemctl start update_desktop_bg_weather@$USER.timer
fi

exit 0
