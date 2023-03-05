#!/bin/bash

echo Which directory would you like to enumerate?
read TODIR

cd $TODIR
ls -alh
exit 0
