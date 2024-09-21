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
    sudo apt install build-essential
}

install_lib
install_git
install_curl
check_sudo
# Check if Homebrew is already installed
printf "${YELLOW}Checking if Homebrew is already installed...${NC}\n"
if ! command -v brew &> /dev/null
then
    printf "${YELLOW}Homebrew is not installed. Installing Homebrew...${NC}\n"
    install_homebrew
else
    printf "${GREEN}Homebrew is already installed.${NC}\n"
    # Check if install_packages.sh exists
    if [[ -f install_packages.sh ]]; then
        # Run the script to install other packages
        printf "${YELLOW}Running the script to install other packages...${NC}\n"
        bash install_packages.sh
    else
        printf "${RED}Error: install_packages.sh not found.${NC}\n"
        exit 1
    fi
fi

# Function to check if Homebrew is installed
check_brew_installed() {
    if command -v brew &> /dev/null; then
        return 0
    else
        return 1
    fi
}

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
