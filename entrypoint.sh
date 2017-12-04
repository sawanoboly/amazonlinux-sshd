#!/bin/bash

env > /tmp/env.txt

root_pw=${ROOT_PW:-rooooot}

# generate host keys if not present
ssh-keygen -A

echo "root:$root_pw" | chpasswd

# do not detach (-D), log to stderr (-e), passthrough other arguments
exec /usr/sbin/sshd -d -D -e "$@"
