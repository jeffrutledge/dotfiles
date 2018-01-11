#!/bin/sh
#
# Configuring System Daemons
#
# This configures system daemons for arch.

cd "$(dirname $0)"

echo "Configuring System Daemons"

sh install_suspend_service.sh 

echo "Finished System Daemons
echo ""

exit 0
