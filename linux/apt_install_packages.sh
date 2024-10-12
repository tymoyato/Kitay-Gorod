#!/bin/bash

install_packages_with_apt() {
	local packages=("$@")

	# Update package lists
	print_message "Updating package lists..." "instruction"
	sudo apt update

	print_message "Installing packages with apt..." "instruction"

	for package in "${packages[@]}"; do
		print_message "Installing ${package}..." "instruction"
		sudo apt install -qq -y "$package"
	done

	print_message "All packages installed successfully." "success"
}
