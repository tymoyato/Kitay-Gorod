#!/bin/bash

source ./colors.sh
source ./linux.sh

# Function to install kitty
install_kitty() {
    printf "${YELLOW}Installing kitty...${NC}\n"
    curl -L https://sw.kovidgoyal.net/kitty/installer.sh | sh /dev/stdin
    printf "${GREEN}kitty installed successfully.${NC}\n"
}