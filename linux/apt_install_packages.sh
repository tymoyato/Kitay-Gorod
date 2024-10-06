#!/bin/bash

install_packages_with_apt() {
	local packages=("$@")

	# Update package lists
	printf '%sUpdating package lists...%s\n' "$YELLOW" "$NC"
	sudo apt update

	printf '%sInstalling packages with apt...%s\n' "$YELLOW" "$NC"

	for package in "${packages[@]}"; do
		printf "${YELLOW}Installing %s...${NC}\n" "$package"
		sudo apt install -y "$package"
	done

	printf '%sAll packages installed successfully.%s\n' "$GREEN" "$NC"
}
