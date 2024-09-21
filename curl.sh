#!/bin/bash

source ./colors.sh
source ./os.sh

# Function to install curl
install_curl() {
    # Check if curl is installed
    printf "${YELLOW}Checking if curl is installed...${NC}\n"
    if ! command -v curl &> /dev/null
    then
        printf "${YELLOW}curl is not installed. Installing curl...${NC}\n"
        if [[ "$OS" == "Linux" ]]; then
            sudo apt-get update
            sudo apt-get install -y curl
        elif [[ "$OS" == "Darwin" ]]; then
            /usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
            brew install curl
        else
            printf "${RED}Unsupported operating system: $(uname -s)${NC}\n"
            exit 1
        fi
    else
        printf "${GREEN}curl is already installed.${NC}\n"
    fi
}
