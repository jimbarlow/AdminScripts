#!/bin/bash
autossh -M 2000 -o StrictHostKeyChecking=no -o UserKnownHostsFile=/dev/null -fN -R 7000:localhost:22 -p <sshport> <user>@<domainname>
