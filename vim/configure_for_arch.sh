#!/bin/sh
#
# Configuring Vim
#
# This configures vim's components for arch.

cd "$(dirname $0)"

echo "Configuring Vim"

sh install_vundle.sh 
sh compile_ycm_arch.sh

echo "Finished Configuring Vim"
echo ""

exit 0
