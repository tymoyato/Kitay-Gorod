#!/bin/bash

source ./colors.sh
source ./linux.sh

# Function to install git
install_git() {
    # Check if git is installed on Linux
    printf "${YELLOW}Checking if git is installed on Linux...${NC}\n"
    if ! command -v git &> /dev/null
    then
        printf "${YELLOW}git is not installed. Installing git...${NC}\n"
        sudo apt-get update
        sudo apt-get install -y git
    else
        printf "${GREEN}git is already installed.${NC}\n"
    fi
}