#!/bin/bash

source ./colors.sh
source ./check_sudo.sh
source ./curl.sh
source ./git.sh
source ./kitty.sh
source ./os.sh

# Linux install lib
install_lib() {
    printf "${YELLOW}Install lib on Linux...${NC}\n"
    sudo apt update
    sudo apt install build-essential -y
}

#check_sudo
#install_lib
#install_git
#install_curl
#install_kitty

# Run each function in the background and wait for it to complete before proceeding to the next one
check_sudo &
wait

install_lib &
wait

install_git &
wait

install_curl &
wait

install_kitty &
wait

printf "${GREEN}All installations completed.${NC}\n"
