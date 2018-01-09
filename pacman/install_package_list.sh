#!/bin/sh
#
# Configuring Pacman
#
# This installs packages in package_list.

echo -e "\t - installing packages in package list."
exit 0

echo -e "\t - installing packages in package list."
pacman -Syu && pacman -S `cat package_list`
