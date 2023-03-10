#! /bin/bash

mkdir /tmp/script-output
OUTPUT_FILE=/tmp/script-output/log.txt

touch $OUTPUT_FILE

echo "Running setup..." >> $OUTPUT_FILE
echo $'\n' >> $OUTPUT_FILE

sudo -E ./general/ubuntu-server.sh
sudo -E ./vim/ubuntu-server-vim.sh
sudo -E ./zsh/ubuntu-zsh-generic.sh

sudo -E ./ssh/config-bitbucket.sh $OUTPUT_FILE
echo $'\n' >> $OUTPUT_FILE

sudo -E ./ssh/config-github.sh $OUTPUT_FILE
echo $'\n' >> $OUTPUT_FILE

sudo -E ./ssh/config-gitlab.sh $OUTPUT_FILE
echo $'\n' >> $OUTPUT_FILE

sudo -E ./ssh/config-lan-known-hosts.sh

# To work correctly, ssh files must be owner/group of original user, not sudo
sudo -E chown -R $(who am i | awk '{print $1}'):$(who am i | awk '{print $1}') ~/.ssh/*

echo "Setup complete" >> $OUTPUT_FILE

cat $OUTPUT_FILE
rm $OUTPUT_FILE
