#!/bin/bash

# ANSI color codes
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
RED='\033[0;31m'
NC='\033[0m' # No Color

# Detect the operating system
printf "${YELLOW}Detecting the operating system...${NC}\n"
OS=$(uname -s)

if [[ "$OS" == "Linux" ]]; then
    # Check if the user is in the sudoers file
    printf "${YELLOW}Checking if the user has sudo privileges...${NC}\n"
    if ! sudo -n true 2>/dev/null; then
        printf "${YELLOW}User does not have sudo privileges. Adding user to sudoers...${NC}\n"
        if [[ "$(uname -s)" == "Linux" ]]; then
            sudo_user=$(whoami)
            sudo_command="echo '$sudo_user ALL=(ALL) NOPASSWD:ALL' >> /etc/sudoers"
            su -c "$sudo_command"
        else
            printf "${RED}Unsupported operating system for adding sudo privileges: $(uname -s)${NC}\n"
            exit 1
        fi
    else
        printf "${GREEN}User has sudo privileges.${NC}\n"
    fi

    # Check if curl is installed
    printf "${YELLOW}Checking if curl is installed...${NC}\n"
    if ! command -v curl &> /dev/null
    then
        printf "${YELLOW}curl is not installed. Installing curl...${NC}\n"
        if [[ "$(uname -s)" == "Linux" ]]; then
            sudo apt-get update
            sudo apt-get install -y curl
        elif [[ "$(uname -s)" == "Darwin" ]]; then
            /usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
            brew install curl
        else
            printf "${RED}Unsupported operating system: $(uname -s)${NC}\n"
            exit 1
        fi
    else
        printf "${GREEN}curl is already installed.${NC}\n"
    fi

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
fi

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
