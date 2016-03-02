#!/bin/bash

RED='\033[1;31m'
GREEN='\033[1;32m'
YELLOW='\033[1;33m'
NO_COLOR='\033[0m'

printf "${GREEN}Container successfully started!${NO_COLOR}\n"

while [ 1 ]; do tail -f /dev/null; test $? -gt 128 && break; done