#!/bin/bash

install_packages_with_brew() {
	local packages=("$@")

	# Update package lists
	printf "${YELLOW}Updating package lists...${NC}\n"
	brew update

	printf "${YELLOW}Installing packages with Homebrew...${NC}\n"

	for package in "${packages[@]}"; do
		printf "${YELLOW}Installing %s...${NC}\n" "$package"
		brew install "$package"
	done

	printf "${GREEN}All packages installed successfully.${NC}\n"
}
