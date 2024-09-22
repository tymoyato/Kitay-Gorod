#!/bin/bash

source ./colors.sh
source ./os.sh

# Function to install curl
install_curl() {
    # Check if curl is installed
    printf "${YELLOW}Checking if curl is installed...${NC}\n"

    if ! command -v curl &> /dev/null; then
        printf "${YELLOW}curl is not installed. Installing curl...${NC}\n"

        if [[ "$OS" == "Linux" ]]; then
            # Update package list
            if ! sudo apt-get update; then
                printf "${RED}Failed to update package list.${NC}\n"
                return 1
            fi

            # Install curl
            if ! sudo apt-get install -y curl; then
                printf "${RED}Failed to install curl.${NC}\n"
                return 1
            fi

            printf "${GREEN}curl has been successfully installed.${NC}\n"

        elif [[ "$OS" == "Darwin" ]]; then
            # Install Homebrew if not already installed
            if ! command -v brew &> /dev/null; then
                if ! /usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"; then
                    printf "${RED}Failed to install Homebrew.${NC}\n"
                    return 1
                fi
            fi

            # Install curl using Homebrew
            if ! brew install curl; then
                printf "${RED}Failed to install curl.${NC}\n"
                return 1
            fi

            printf "${GREEN}curl has been successfully installed.${NC}\n"

        else
            printf "${RED}Unsupported operating system: $(uname -s)${NC}\n"
            return 1
        fi
    else
        printf "${GREEN}curl is already installed.${NC}\n"
    fi

    return 0
}
