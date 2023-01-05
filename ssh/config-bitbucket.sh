#! /bin/bash

# Allows arg 1 to be a file name to push messages to

echo "Creating ssh keys for bitbucket..."

if [ ! -d ~/.ssh ]; then
	mkdir ~/.ssh;
	chmod 700 ~/.ssh
fi; 

cd ~/.ssh

ssh-keygen -f bitbucket_rsa -t rsa

touch config

cat << EOF | sudo tee -a config > /dev/null
Host bitbucket.org
	HostName bitbucket.org
	IdentityFile ~/.ssh/bitbucket_rsa
	User git
EOF

if [ ! -n "$1" ]; then
   echo "Copy the following into a new ssh key on bitbucket (https://bitbucket.org/account/user):"
   cat bitbucket_rsa.pub
else
   echo "Copy the following into a new ssh key on bitbucket (https://bitbucket.org/account/user):" >> $1 
   cat bitbucket_rsa.pub >> $1
fi

echo "bitbucket keys created"

# return to directory used before script
cd -
