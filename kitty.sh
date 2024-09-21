#!/bin/bash

source ./colors.sh
source ./os.sh

# Function to install kitty
#install_kitty() {
#    printf "${YELLOW}Installing kitty...${NC}\n"
#    curl -L https://sw.kovidgoyal.net/kitty/installer.sh | sh /dev/stdin
#    printf "${GREEN}kitty installed successfully.${NC}\n"
#}

install_kitty() {
    printf "${YELLOW}Installing kitty...${NC}\n"

    # Download and run the kitty installer script
    if ! curl -L https://sw.kovidgoyal.net/kitty/installer.sh | sh /dev/stdin; then
        printf "${RED}Failed to install kitty.${NC}\n"
        return 1
    fi

    printf "${GREEN}kitty installed successfully.${NC}\n"
    return 0
}
