#! /bin/bash

echo "Disabling known_host checking for LAN..."

if [ ! -d ~/.ssh ]; then
	mkdir ~/.ssh;
	chmod 700 ~/.ssh
fi; 

cd ~/.ssh

touch config

# Disable known_host checking for LAN because virtual machines are often deleted and
# replaced, after which ssh is disabled because host fingerprint fails.

cat << EOF | sudo tee -a config > /dev/null
Host 192.168.*.*
	CheckHostIp no
	StrictHostKeyChecking no
	LogLevel FATAL
	UserKnownHostsFile=/dev/null
EOF

echo "lan setup completed"

# return to directory used before script
cd -
