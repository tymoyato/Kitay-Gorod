#!/bin/bash

install_homebrew() {
	# Install Homebrew on Linux
	printf '%sInstalling Homebrew on Linux...%s\n' "${YELLOW}" "${NC}"
	check_curl
	yes | /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
	# Add Homebrew to the PATH
	printf '%sAdding Homebrew to the PATH on Linux...%s\n' "${YELLOW}" "${NC}"
	echo "eval $(/home/linuxbrew/.linuxbrew/bin/brew shellenv)" >>~/.bashrc
}
