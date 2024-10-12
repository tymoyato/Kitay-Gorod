#!/bin/bash

source_brave() {
	check_curl
	# Add Brave Browser GPG key
	print_message "Adding Brave Browser Beta GPG key..." "instruction"
	sudo curl -fsSLo /usr/share/keyrings/brave-browser-archive-keyring.gpg https://brave-browser-apt-release.s3.brave.com/brave-browser-archive-keyring.gpg

	# Add Brave Browser repository
	print_message "Adding Brave Browser Beta repository..." "instruction"
	echo "deb [signed-by=/usr/share/keyrings/brave-browser-archive-keyring.gpg] https://brave-browser-apt-release.s3.brave.com/ stable main" | sudo tee /etc/apt/sources.list.d/brave-browser-release.list
}
