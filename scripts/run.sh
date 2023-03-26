#!/bin/sh

SSH_USER=${SSH_USER:-"root"}
SSH_PASWD=${SSH_PASWD:-"secret"}

if [ "$SSH_USER" != "root" ]; then
    useradd -s /bin/bash -d /home/$SSH_USER/ -m -G sudo $SSH_USER
fi

echo "$SSH_USER:$SSH_PASWD" | chpasswd

echo 'Start ssh server'
/usr/sbin/sshd -D