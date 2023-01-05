#! /bin/bash

# Allows arg 1 to be a file name to push messages to

echo "Creating ssh keys for github..."

if [ ! -d ~/.ssh ]; then
	mkdir ~/.ssh;
	chmod 700 ~/.ssh
fi; 

cd ~/.ssh

ssh-keygen -f github_rsa -t rsa -b 4096

touch config

cat << EOF | sudo tee -a config > /dev/null
Host github.com
	HostName github.com
	IdentityFile ~/.ssh/github_rsa
	User git
EOF

if [ ! -n "$1" ]; then
   echo "Copy the following into a new key on github (https://github.com/settings/keys):"
   cat github_rsa.pub
else
   echo "Copy the following into a new key on github (https://github.com/settings/keys):" >> $1
   cat github_rsa.pub >> $1
fi

echo "github keys created"

# return to directory used before script
cd -
