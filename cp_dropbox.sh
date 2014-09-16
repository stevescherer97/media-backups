#!/bin/bash

tmp='/home/wlss26/Dropbox/tmp4.txt';
email_script='/home/wlss26/Dropbox/cp_status.py';
cp_script='/home/wlss26/Dropbox/backup_dropbox_pics.py';

before_count=`find /home/wlss26/Dropbox/Camera\ Uploads/ -type f -print | wc -l`
/usr/local/bin/python $cp_script;
after_count=`find /home/wlss26/Dropbox/Camera\ Uploads/ -type f -print | wc -l`

echo "Before copy, Dropbox/Camera\ Uploads file total -- $before_count  After move Dropbox/Camera\ Uploads -- $after_count."  > $tmp;
/usr/local/bin/python $email_script;
