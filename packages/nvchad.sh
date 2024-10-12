#!/bin/bash

install_nvchad() {
	check_git
	print_message "Installing nvchad..." "instruction"
	# Define the directory path
	nvim_config_dir="$HOME/.config/nvim"

	# Check if the directory exists
	if [ -d "$nvim_config_dir" ]; then
		print_message "The directory ${nvim_config_dir} already exists." "fail"
	else
		print_message "The directory ${nvim_config_dir} does not exist. Cloning the repository..." "instruction"
		git clone https://github.com/NvChad/starter "$nvim_config_dir"
		print_message "Repository cloned successfully." "success"
	fi
}
