#!/bin/bash

install_packages_with_brew() {
	local packages=("$@")

	# Update package lists
	print_message "Updating package lists..." "instruction"
	brew update

	print_message "Installing packages with Homebrew..." "instruction"

	for package in "${packages[@]}"; do
		print_message "Installing ${package}" "instruction"
		brew install "$package"
	done

	print_message "All packages installed successfully." "success"
}
