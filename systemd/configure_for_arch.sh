#!/bin/sh
#
# Configuring System Daemons
#
# This configures system daemons for arch.

cd "$(dirname $0)"

echo "Configuring System Daemons"

sh install_suspend_service.sh 
sh install_dynamic_desktop_timer.sh

echo "Finished System Daemons
echo ""

exit 0
