#!/bin/sh
#
# Configuring ipython
#
# This configures ipython's components for arch.

cd "$(dirname $0)"

echo "Configuring ipython"

sh symlink_default_profile.sh 

echo "Finished Configuring ipython"
echo ""

exit 0
