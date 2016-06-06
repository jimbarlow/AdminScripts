#!/bin/bash -x
# this script backs up essential bits from the main server to allow this system to function
# as a backup
#
rsync -avz --delete root@192.168.1.85:/home/partimag/* /home/partimag
if [ "$?" != "0" ]
then

	echo "Image rsync failed for some reason" | mail serverteam -s "Rsync Failure Alert at plonezilla"
fi
# rsync -avz --delete root@192.168.1.53:/usr/local/Plone /home/partimag
