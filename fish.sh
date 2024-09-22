#!/bin/bash

source ./colors.sh
source ./os.sh

# Function to check if a command succeeds
check_command() {
    if [ $? -ne 0 ]; then
        printf "${RED}Command failed: $1${NC}\n"
        exit 1
    fi
}

printf "${YELLOW}git is not installed. Installing git...${NC}\n"
sudo add-shell /home/linuxbrew/.linuxbrew/bin/fish
check_command "sudo add-shell /home/linuxbrew/.linuxbrew/bin/fish"

printf "${YELLOW}git is not installed. Installing git...${NC}\n"
chsh -s /home/linuxbrew/.linuxbrew/bin/fish
check_command "chsh -s /home/linuxbrew/.linuxbrew/bin/fish"

printf "${GREEN}All commands succeeded.${NC}\n"
