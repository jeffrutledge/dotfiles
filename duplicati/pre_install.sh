#!/bin/sh

# this forces stow to symlink the file instead of duplicati.service.d
# when duplicati.service.d is a dir systemctl doesn't see the override
mkdir -p ~/.config/systemd/user/duplicati.service.d
