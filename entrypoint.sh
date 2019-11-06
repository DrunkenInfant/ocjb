#!/bin/bash
# generate host keys if not present
ssh-keygen -A
# Add ssh authorized keys if provided
if [ -n "$SSH_AUTH_KEY" ]; then
  mkdir -p /root/.ssh
  echo "$SSH_AUTH_KEY" > /root/.ssh/authorized_keys
fi
# Start sshd as a non-detached background service
exec /usr/sbin/sshd -D &

exec "$@"
