#!/bin/bash

install_packages_with_apt() {
	local packages=("$@")

	# Update package lists
	printf "${YELLOW}Updating package lists...${NC}\n"
	sudo apt update

	printf "${YELLOW}Installing packages with apt...${NC}\n"

	for package in "${packages[@]}"; do
		printf "${YELLOW}Installing %s...${NC}\n" "$package"
		sudo apt install -y "$package"
	done

	printf "${GREEN}All packages installed successfully.${NC}\n"
}
