#!/bin/bash

install_homebrew() {
	# Install Homebrew on Linux
	print_message "Installing Homebrew on Linux..." "instruction"
	check_curl
	yes | /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
	# Add Homebrew to the PATH
	print_message "Adding Homebrew to the PATH on Linux..." "instruction"
	echo "eval $(/home/linuxbrew/.linuxbrew/bin/brew shellenv)" >>~/.bashrc
}
