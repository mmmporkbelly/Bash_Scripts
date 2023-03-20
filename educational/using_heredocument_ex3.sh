#!/bin/bash
# Show the real usefulness of here document
# Suppose you want to start a session and grab a document
#
lftp kali@localhost << endofsession
ls
get hosts
bye
endofsession

echo The file has been downloaded

