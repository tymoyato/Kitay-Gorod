#!/bin/bash

install_homebrew() {
	# Install Homebrew on Linux
	printf "${YELLOW}Installing Homebrew on Linux...${NC}\n"
	check_curl
	yes | /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
	# Add Homebrew to the PATH
	printf "${YELLOW}Adding Homebrew to the PATH on Linux...${NC}\n"
	echo 'eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)"' >>~/.bashrc
}
