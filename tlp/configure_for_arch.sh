#!/bin/sh
#
# Configuring TLP
#
# This configures tlp components for arch.

cd "$(dirname $0)"

echo "Configuring TLP"

# Mask to avoid conflicts
systemctl mask systemd-rfkill.service
systemctl mask systemd-rfkill.socket

systemctl enable tlp.service
systemctl enable tlp-sleep.service

echo "Remember to set USB_BLACKLIST_PHONE=1 to enable phone charging."

echo "Finished Configuring TLP"
echo ""

exit 0
