#!/bin/sh
#
# systemd
#
# This enables a service that locks on suspend

echo -e "\t - enabling suspend lock service."
sudo cp ./suspend@.service /etc/systemd/system/
systemctl enable suspend@$USER

exit 0
