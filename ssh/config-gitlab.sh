#! /bin/bash

# Allows arg 1 to be a file name to push messages to

echo "Creating ssh keys for gitlab..."

if [ ! -d ~/.ssh ]; then
	mkdir ~/.ssh;
	chmod 700 ~/.ssh
fi; 

cd ~/.ssh

ssh-keygen -f gitlab_rsa -t rsa

touch config

cat << EOF | sudo tee -a config > /dev/null
Host gitlab.com
   PreferredAuthentications publickey
	IdentityFile ~/.ssh/gitlab_rsa
EOF

if [ ! -n "$1" ]; then
   echo "Copy the following into a new ssh key (https://gitlab.com/-/profile/keys):"
   cat gitlab_rsa.pub
else
   echo "Copy the following into a new ssh key (https://gitlab.com/-/profile/keys):" >> $1
   cat gitlab_rsa.pub >> $1
fi

echo "gitlab keys created"

# return to directory used before script
cd -
