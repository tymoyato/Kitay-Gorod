#!/bin/bash

source ./colors.sh
source ./linux.sh

# Function to install packages with brew
install_packages_with_brew() {
    printf "${YELLOW}Installing packages with Homebrew...${NC}\n"
    for package in "$@"; do
        printf "${YELLOW}Installing %s...${NC}\n" "$package"
        brew install "$package"
    done
    printf "${GREEN}All packages installed successfully.${NC}\n"
}

# List of packages to install
packages=(rbenv nvm fish eza btop atuin jless difftastic bat fzf zoxide neovim fisher ripgrep nvim unzip zellij)

# Call the function with the list of packages
install_packages_with_brew "${packages[@]}"