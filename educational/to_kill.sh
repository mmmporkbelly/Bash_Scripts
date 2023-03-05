#!/bin/bash
#
# Ask what process to stop and then kill it

echo Which process do you want to kill?
read TOKILL

# Kills all relevant scripts that match
kill $(ps aux | grep $TOKILL | grep -v grep | awk '{ print $2 }')
