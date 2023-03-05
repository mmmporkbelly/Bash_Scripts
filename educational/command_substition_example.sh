#!/bin/bash
#
#This script shows how command substitution works, using the date command
#date +%d-%m-%y would return day-month-year
#This is the revised version of the storing old logs script

sudo cp /var/log/messages /var/log/messages.$(date +%d-%m-%y)
sudo cat /dev/null > /var/log/messages
echo Successfully archived logs

exit 0
