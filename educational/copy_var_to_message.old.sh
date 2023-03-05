#!/bin/bash
# This script copies old messages from /var/log/messages and moves them
# Also wipes /var/log/messages
cp /var/log/messages /var/log/messages.old
cat /dev/null > /var/log/messages
echo log file copied and cleaned up
exit 0
