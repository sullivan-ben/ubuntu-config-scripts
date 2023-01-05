#! /bin/bash

OUTPUT_FILE=/tmp/config-log.txt

echo "Running setup..." >> $OUTPUT_FILE
echo "\n" >> $OUTPUT_FILE

./general/ubuntu-server.sh
./vim/ubuntu-server-vim.sh
./zsh/ubuntu-zsh-generic.sh

./ssh/config-bitbucket.sh $OUTPUT_FILE
echo $'\n' >> $OUTPUT_FILE

./ssh/config-github.sh $OUTPUT_FILE
echo $'\n' >> $OUTPUT_FILE

./ssh/config-gitlab.sh $OUTPUT_FILE
echo $'\n' >> $OUTPUT_FILE

./ssh/config-lan-known-hosts.sh

echo "Setup complete" >> $OUTPUT_FILE

cat $OUTPUT_FILE
rm $OUTPUT_FILE
