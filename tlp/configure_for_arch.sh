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

echo "Finished Configuring TLP"
echo ""

exit 0
