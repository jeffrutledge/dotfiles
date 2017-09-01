#!/bin/zsh
sudo cp ./suspend@.service /etc/systemd/system/
systemctl enable suspend@$USER
