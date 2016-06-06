#!/bin/bash -x
for i in  80 72 75 87 90 91 92 95

do  ssh root@$192.168.1.$i echo "192.168.1.87	spacewalk.cfyatl.local spacewalk" >> /etc/hosts
done
