#!/bin/sh


echo "Installing TLP"

pacman -S tlp

echo "Configuring TLP"

# Mask to avoid conflicts
systemctl mask systemd-rfkill.service
systemctl mask systemd-rfkill.socket

systemctl enable --now tlp.service
systemctl enable --now tlp-sleep.service

echo "\nRemember to set USB_BLACKLIST_PHONE=1 in /etc/default/tlp to enable phone charging.\n"

echo "Finished Configuring TLP"
