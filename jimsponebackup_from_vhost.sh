#!/bin/bash
# this script backs up the Plone data for the Affiliates
DESTINATION='plonebackup@192.168.1.80:/home/plonebackup'
# let's put a timestamp into the log
echo "$(date) beginning backup of the Plone instance" >> plonebackup.log
# we will run the repozo backup script located in the Plone instance

/usr/local/Plone/zeocluster/bin/backup

if [ "$?" != "0" ]

then
	echo "Plone backup Script Failed on the bin/backup script" | mail  -s "Plone backup script error" jim
fi
#the following copies the backup directories to another server just in case.   Hard link prevents data recopying
rsync -avz --delete --hard-links /usr/local/Plone/zeocluster/var/*backup* $DESTINATION 
if [ "$?" != "0" ]
then
	echo "Plone rsync backup failed from `hostname` to $DESTINATION" | mail -s "Plone Rsync Failure Alert at Plonezilla" jim
else
	# let's email the administrator so we can monitor the storage used on the backup server...
	echo -e "`ssh plonebackup@192.168.1.80 "du -h --summarize" ` \n\n was used on $DESTINATION by /root/jimsplonebackup.sh" | mail -s "Plone Backup" root
fi
	
