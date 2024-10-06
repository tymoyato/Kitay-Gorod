#!/bin/bash

install_packages_with_brew() {
	local packages=("$@")

	# Update package lists
	printf '%sUpdating package lists...%s\n' "$YELLOW" "$NC"
	brew update

	printf '%sInstalling packages with Homebrew...%s\n' "$YELLOW" "$NC"

	for package in "${packages[@]}"; do
		printf "${YELLOW}Installing %s...${NC}\n" "$package"
		brew install "$package"
	done

	printf '%sAll packages installed successfully.%s\n' "$GREEN" "$NC"
}
