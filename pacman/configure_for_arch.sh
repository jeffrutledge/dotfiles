#!/bin/sh
#
# Configuring Pacman
#
# This configures pacmans's components for arch.

cd "$(dirname $0)"
echo "Configuring Pacman"

sh install_package_list.sh

echo "Finished Configuring Pacman"
echo ""

exit 0
