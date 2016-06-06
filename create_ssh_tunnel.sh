#!/bin/bash
createTunnel() {
  /usr/bin/ssh -o StrictHostKeyChecking=no -o UserKnownHostsFile=/dev/null -fN -R 7000:localhost:22 -p <sshport> <username>@<domainname>
  if [[ $? -eq 0 ]]; then
    echo Tunnel to cfyatl support created successfully
  else
    echo An error occurred creating a tunnel to destination. RC was $?
  fi
}
# If ssh s already running, skip the tunnel
/sbin/pidof ssh
if [[ $? -ne 0 ]]; then
  echo Creating new tunnel connection
  createTunnel
fi
