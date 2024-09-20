#!/bin/bash

source ./colors.sh
source ./linux.sh

# Function to install Homebrew
install_homebrew() {
    if [[ "$OS" == "Linux" ]]; then
        # Install Homebrew on Linux
        printf "${YELLOW}Installing Homebrew on Linux...${NC}\n"
        /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
        # Add Homebrew to the PATH
        printf "${YELLOW}Adding Homebrew to the PATH on Linux...${NC}\n"
        echo 'eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)"' >> ~/.bashrc
        source ~/.bashrc
    elif [[ "$OS" == "Darwin" ]]; then
        # Install Homebrew on macOS
        printf "${YELLOW}Installing Homebrew on macOS...${NC}\n"
        /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
        # Add Homebrew to the PATH
        printf "${YELLOW}Adding Homebrew to the PATH on macOS...${NC}\n"
        echo 'eval "$(/opt/homebrew/bin/brew shellenv)"' >> ~/.bashrc
        source ~/.bashrc
    else
        printf "${RED}Unsupported operating system: $OS${NC}\n"
        exit 1
    fi
}