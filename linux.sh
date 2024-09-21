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
#check_sudo &
#install_lib &
#install_git &
#install_curl &
#install_kitty &

#mkfifo /tmp/check_sudo
#check_sudo &
#read -r signal < /tmp/check_sudo
#rm /tmp/check_sudo

# Create named pipes for each function
mkfifo /tmp/install_lib_pipe
mkfifo /tmp/install_git_pipe
mkfifo /tmp/install_curl_pipe
mkfifo /tmp/install_kitty_pipe

# Run the functions in the background and capture their outputs
install_lib > /tmp/install_lib_pipe &
install_git > /tmp/install_git_pipe &
install_curl > /tmp/install_curl_pipe &
install_kitty > /tmp/install_kitty_pipe &

# Read from the pipes to capture the outputs
read -r lib_output < /tmp/install_lib_pipe
read -r git_output < /tmp/install_git_pipe
read -r curl_output < /tmp/install_curl_pipe
read -r kitty_output < /tmp/install_kitty_pipe

# Remove the named pipes
rm /tmp/install_lib_pipe
rm /tmp/install_git_pipe
rm /tmp/install_curl_pipe
rm /tmp/install_kitty_pipe

printf "${GREEN}All installations completed.${NC}\n"
