#!/bin/bash

# using at job 08:00 2017-11-18
# MP2 backup
YELLOW="\033[1;33m"
BLUE="\033[1;34m"
NORMAL="\033[0m"

printf $YELLOW
echo ":: starting backup job ::"

printf $BLUE
date

# rsync
printf $YELLOW
echo ":: rsync backup /home/os2017/backupMP2 ::"
printf $NORMAL
rsync -rtpl /home/os2017/2017osteam*  /home/os2017/backupMP2

printf $YELLOW
echo ":: change ownership ::"
printf $NORMAL
chown -R 2017TA:2017OS_TAs /home/os2017/backupMP2

printf $YELLOW
echo ":: backup finish ::"


# new version method
# Local:  rsync [OPTION...] SRC... [DEST]
rsync --remove-source-files \
      --chown=redfish:redfish /home/src /home/dest
