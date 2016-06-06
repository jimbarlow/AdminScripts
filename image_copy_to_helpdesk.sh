#!/bin/bash -x
# this script backs up essential bits from the main server to allow this system to function
# as a backup
#
rsync -avz --partial --exclude "Clonezilla*" /mnt/glustershare/* root@helpdesk:/home/partimag/ 
if [ "$?" != "0" ]
# let's email the administrator so we can monitor the storage used on the HelpDesk server...
then

	echo "Image rsync failed for some reason" | mail -s "Rsync Failure Alert at vhost2 to HelpDesk" root

	echo -e "`ssh root@192.168.1.95 "df -h /home/partimag" ` \n\n was used on HelpDesk at the time of failure" | mail -s "Rsync failure on images" root
fi
