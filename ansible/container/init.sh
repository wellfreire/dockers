#!/bin/bash

RED='\033[1;31m'
GREEN='\033[1;32m'
YELLOW='\033[1;33m'
NO_COLOR='\033[0m'

printf "${YELLOW}Setting some global config...${NO_COLOR}\n"

ansible_cfg_file=~/.ansible.cfg
printf "[defaults]" >> $ansible_cfg_file
printf "\nhost_key_checking = False" >> $ansible_cfg_file
printf "\nask_sudo_pass = False" >> $ansible_cfg_file

printf "${GREEN}Container successfully started!${NO_COLOR}\n"

while [ 1 ]; do tail -f /dev/null; test $? -gt 128 && break; done