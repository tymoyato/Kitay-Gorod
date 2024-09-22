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

    # Update package list
    if ! sudo apt update; then
        printf "${RED}Failed to update package list.${NC}\n"
        return 1
    fi

    # Install build-essential
    if ! sudo apt install build-essential -y; then
        printf "${RED}Failed to install build-essential.${NC}\n"
        return 1
    fi

    printf "${GREEN}Successfully installed build-essential.${NC}\n"
    return 0
}

check_sudo
install_lib
install_git
install_curl

printf "${GREEN}All installations completed.${NC}\n"
