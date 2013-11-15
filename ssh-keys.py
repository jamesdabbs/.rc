#!/usr/bin/python
#
# Creates an ssh key for this box and uploads it to Github and Bitbucket
#

import json
from getpass import getpass
from subprocess import call, check_output

location = raw_input("Input a name for this box > ")
label    = "james@%s" % location


print "\n== GENERATING AN SSH KEY =="
call(["ssh-keygen", "-t", "rsa", "-f", ".ssh/id_rsa", "-N", "", "-C", "james@%s" % location])
key = open(".ssh/id_rsa.pub").read()


print "\n== UPDATING KEYS IN GITHUB =="
username = raw_input("Username (enter for 'jamesdabbs') > ") or "jamesdabbs"
password = getpass("Password > ")

# Get the existing Github keys
keys = json.loads(check_output([
  "curl",
  "-u", "%s:%s" % (username, password),
  "https://api.github.com/user/keys"
]))

# Delete keys matching this label, if present
# Store the others as authorized
authorized_keys = []
for k in keys:
  if k["title"] == label:
    call([
      "curl",
      "-u", "%s:%s" % (username, password),
      "-X", "DELETE",
      "https://api.github.com/user/keys/%d" % k["id"]
    ])
  else:
    authorized_keys.append("%s %s" % (k["key"], k["title"]))

with open(".ssh/authorized_keys", "w") as f:
  f.write("\n".join(authorized_keys))

# Upload the new key
call([
  "curl", 
  "-u", "%s:%s" % (username, password), 
  "-X", "POST", 
  "-H", "Content-type: application/json", 
  "-d", json.dumps({"title": label, "key": key}), 
  "https://api.github.com/user/keys"
])


print "\n== UPLOADING KEY TO BITBUCKET =="
username = raw_input("Username (enter for 'jamesdabbs') > ") or "jamesdabbs"
password = getpass("Password > ")

keys = json.loads(check_output([
  "curl",
  "-u", "%s:%s" % (username, password),
  "https://bitbucket.org/api/1.0/users/%s/ssh-keys" % username
]))

for k in keys:
  if k["label"] == label:
    call([
      "curl",
      "-u", "%s:%s" % (username, password),
      "-X", "DELETE",
      "https://bitbucket.org/api/1.0/users/%s/ssh-keys/%s" % (username, k["id"])
    ])

call([
  "curl",
  "-u", "%s:%s" % (username, password),
  "-X", "POST",
  "-H", "Content-type: application/json",
  "-d", json.dumps({"label": label, "key": key}),
  "https://bitbucket.org/api/1.0/users/%s/ssh-keys" % username
])


