#!/bin/bash

source ./colors.sh
source ./os.sh

# Function to install git
install_git() {
    # Check if git is installed on Linux
    printf "${YELLOW}Checking if git is installed on Linux...${NC}\n"

    if ! command -v git &> /dev/null; then
        printf "${YELLOW}git is not installed. Installing git...${NC}\n"

        # Update package list
        if ! sudo apt-get update; then
            printf "${RED}Failed to update package list.${NC}\n"
            return 1
        fi

        # Install git
        if ! sudo apt-get install -y git; then
            printf "${RED}Failed to install git.${NC}\n"
            return 1
        fi

        printf "${GREEN}git has been successfully installed.${NC}\n"
    else
        printf "${GREEN}git is already installed.${NC}\n"
    fi

    return 0
}
