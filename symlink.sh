#!/bin/bash

setup_configs() {
	local config_dir="$HOME/.config"
	local repo_dir="$HOME/Kitay_Gorod/dotfiles"

	# List of configuration directories and files
	local configs=(
		"fish"
		"kitty"
		"nvim"
		#"BraveSoftware/Brave-Browser/Default/Preferences"
	)

	# Remove existing configurations
	for config in "${configs[@]}"; do
		rm -rf "${config_dir:?}/${config:?}"
	done

	# Create symbolic links
	for config in "${configs[@]}"; do
		ln -sf "$repo_dir/$config" "$config_dir/$config"
	done

	echo "Configurations have been set up."
}

# Call the function
setup_configs
exec fish
