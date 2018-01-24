#!/bin/bash
# Auto generate key and go through all nodes
#
# 2017/03/30  by Chen-Chun Chen

HOST=hades

rm -rf ~/.ssh
expect -c "
        set timeout 60;
        spawn ssh-keygen -t rsa;
        expect \"Enter file in which to save the key*\"
        send \"\n\"
        expect \"Enter passphrase*\"
        send \"\n\"
        expect \"Enter same passphrase again*\"
        send \"\n\"
        interact
"
cd ~/.ssh
cat id_rsa.pub >> authorized_keys
chmod 400 authorized_keys

for i in {01..05}; do
        expect -c "
        set timeout 60;
        spawn ssh-copy-id ${HOST}${i};
        expect \"Are you sure you want to continue connecting (yes/no)?\"
        send \"yes\n\"
        interact
        "
done
