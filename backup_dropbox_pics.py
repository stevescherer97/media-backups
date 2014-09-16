#!/usr/local/bin/python
import sys
import datetime, time, stat
import os

today = datetime.datetime.today()
today_string = today.strftime("%Y-%m-%d")
month = today.strftime("%b")
year = today.strftime("%Y")
directory = "/media/drive1_ntfs" + "/" + year + "/" + month
if not os.path.exists(directory):
    os.makedirs(directory)
for root, dirs, files in os.walk(directory, topdown=False):
    for dir in dirs:
        os.chmod(root + "/" + dir, stat.S_IRWXO)
    for file in files:
        os.chmod(root + "/" + file, stat.S_IRWXO)
os.system("mv /home/wlss26/Dropbox/Camera\ Uploads/* " + directory)



