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

# Function to run a command and capture its output using a named pipe
run_and_capture() {
    local cmd="$1"
    local pipe="/tmp/${cmd}_pipe"

    # Create the named pipe
    mkfifo "$pipe"

    # Run the command in the background and capture its output
    $cmd > "$pipe" &

    # Read from the pipe to capture the output
    local output
    read -r output < "$pipe"

    # Remove the named pipe
    rm "$pipe"

    # Return the output
    echo "$output"
}

# Run the functions and capture their outputs
lib_output=$(run_and_capture install_lib)
git_output=$(run_and_capture install_git)
curl_output=$(run_and_capture install_curl)
kitty_output=$(run_and_capture install_kitty)

# Optionally, you can print the outputs for debugging purposes
echo "install_lib output: $lib_output"
echo "install_git output: $git_output"
echo "install_curl output: $curl_output"
echo "install_kitty output: $kitty_output"

printf "${GREEN}All installations completed.${NC}\n"
