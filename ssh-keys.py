#!/usr/bin/python
#
# Creates an ssh key for this box and uploads it to Github and Bitbucket
#

import json
from getpass import getpass
from subprocess import call

loc = raw_input("Input a name for this box > ")

print "\n== GENERATING AN SSH KEY =="
call(["ssh-keygen", "-t", "rsa", "-f", ".ssh/id_rsa", "-N", "", "-C", "james@%s" % loc])
label = "james@%s" % loc
key = open(".ssh/id_rsa.pub").read()

print "\n== UPLOADING KEY TO GITHUB =="
username = raw_input("Username (enter for 'jamesdabbs') > ") or "jamesdabbs"
call([
  "curl", 
  "-u", username, 
  "-X", "POST", 
  "-H", "Content-type: application/json", 
  "-d", json.dumps({"title": label, "key": key}), 
  "https://api.github.com/user/keys"
])

print "\n== UPLOADING KEY TO BITBUCKET =="
username = raw_input("Username (enter for 'jamesdabbs') > ") or "jamesdabbs"
call([
  "curl",
  "-u", username,
  "-X", "POST",
  "-H", "Content-type: application/json",
  "-d", json.dumps({"accountname": username, "label": label, "key": key}),
  "https://bitbucket.org/api/1.0/users/%s/ssh-keys" % username
])


