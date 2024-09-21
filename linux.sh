#!/bin/bash

source ./colors.sh
source ./check_sudo.sh
source ./curl.sh
source ./git.sh
source ./homebrew.sh
source ./kitty.sh
source ./os.sh

# Linux install lib
install_lib() {
    printf "${YELLOW}Install lib on Linux...${NC}\n"
    sudo apt update
    sudo apt install build-essential -y
}

install_lib
install_git
install_curl
check_sudo
install_homebrew
install_kitty
install_nvchad

# Check if Homebrew is installed
if ! check_brew_installed; then
    printf "${YELLOW}need to source bashrc.${NC}\n"
    exit 1
else
    # Ensure the PATH is correctly set
    printf "${YELLOW}Ensuring the PATH is correctly set...${NC}\n"
    if [[ "$OS" == "Linux" ]]; then
        eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)"
    elif [[ "$OS" == "Darwin" ]]; then
        eval "$(/opt/homebrew/bin/brew shellenv)"
    fi
    # Verify Homebrew installation
    printf "${YELLOW}Verifying Homebrew installation...${NC}\n"
    brew --version
fi
