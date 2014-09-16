#!/bin/bash

tmp='/home/wlss26/Dropbox/tmp3.txt';
email_script='/home/wlss26/Dropbox/sync_status.py';

# sync files between NTFS1 and NTFS2
before_primary_backup=`find /media/drive1_ntfs/ -type f -print | wc -l`
before_secondary_backup=`find /media/drive2_ntfs/ -type f -print | wc -l`

# sync'ing files between primary backup and secondary backup
rsync -avxHAXW /media/drive1_ntfs /media/drive2_ntfs;

after_primary_backup=`find /media/drive1_ntfs/ -type f -print | wc -l`
after_secondary_backup=`find /media/drive2_ntfs/ -type f -print | wc -l`

echo "Synchronization of files between NTFS1 and NTFS2 has completed.  Primary backup started with -- $before_primary_backup Primary backup finished with -- $after_primary_backup. Secondary Backup started with -- $before_secondary_backup Secondary Backup finished with -- $after_secondary_backup"  > $tmp;

/usr/local/bin/python $email_script;
