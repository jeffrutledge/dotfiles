#!/bin/sh
#
# Configuring mail
#
# This configures components of mail

cd "$(dirname $0)"

echo "Configuring Mail"

sh isync/setup_isync_directories 
sh notmuch/install_hooks 
sh install_mail_sync_timer

echo "Finished Configuring Mail"
echo ""

exit 0
