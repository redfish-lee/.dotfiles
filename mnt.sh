#!/bin/bash

YELLOW="\033[1;33m"
BLUE="\033[1;34m"
NORMAL="\033[0m"

printf $YELLOW
echo "mount refish@deep to Desktop/deep"
mkdir -p Desktop/deep
sshfs deep:/home/redfish Desktop/deep  -o volname=deep