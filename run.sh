#! /bin/bash

OUTPUT_FILE=/tmp/config-log.txt

sudo ./general/ubuntu-server.sh
sudo ./vim/ubuntu-server-vim.sh
sudo ./zsh/ubuntu-zsh-generic.sh

sudo ./ssh/config-bitbucket.sh $OUTPUT_FILE
sudo ./ssh/config-github.sh $OUTPUT_FILE
sudo ./ssh/config-gitlab.sh $OUTPUT_FILE

sudo ./ssh/config-lan-known-hosts.sh

cat $OUTPUT_FILE
rm $OUTPUT_FILE
