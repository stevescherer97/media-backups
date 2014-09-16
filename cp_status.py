#!/usr/bin/python
import sendgrid
import time
import os


currentTime = time.strftime("%Y-%m-%d %H:%M:%S")

# make a secure connection to SendGrid
s = sendgrid.Sendgrid('wlss26', 'Badgers97', secure=True)
subject = "Copy Dropbox Pics to External Drive - " + currentTime
body = "Move files from Dropbox to External Hard Drive.\n\n\n\n"
body2 = "default"
if (os.path.isfile('/home/wlss26/Dropbox/tmp4.txt')):
    with open('/home/wlss26/Dropbox/tmp4.txt') as f:
        body2 = f.read()
    os.remove('/home/wlss26/Dropbox/tmp4.txt')

body2=body2+"\n\n\n\nReplies to this email are discarded.";
# make a message object
message = sendgrid.Message("Pictures@Backup.com", subject, body+body2)
# add a recipient
message.add_to(["steve.scherer97@gmail.com"])
# use the Web API to send your message
s.web.send(message)

