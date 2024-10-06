#!/bin/bash

install_nvchad() {
	check_git
	printf '%sInstalling nvchad...%s\n' "${YELLOW}" "${NC}"
	# Define the directory path
	nvim_config_dir="$HOME/.config/nvim"

	# Check if the directory exists
	if [ -d "$nvim_config_dir" ]; then
		printf '%sThe directory %s already exists.%s\n' "${RED}" "$nvim_config_dir" "${NC}"
	else
		printf '%sThe directory %s does not exist. Cloning the repository...%s\n' "${YELLOW}" "$nvim_config_dir" "${NC}"
		git clone https://github.com/NvChad/starter "$nvim_config_dir"
		printf '%sRepository cloned successfully.%s\n' "${GREEN}" "${NC}"
	fi
}
