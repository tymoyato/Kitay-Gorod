#!/bin/bash

. ./utils/colors.sh
. ./utils/check_sudo.sh
. ./utils/check_curl.sh
. ./utils/check_command.sh
. ./linux/apt_install_packages.sh
. ./linux/brew_install_packages.sh
. ./utils/os.sh
. ./packages/fonts.sh
. ./packages/kitty.sh
. ./packages/nvchad.sh
. ./packages/homebrew.sh
. ./packages/gvm.sh
. ./packages/main.sh
. ./sources/fish.sh
. ./sources/brave.sh

check_sudo

if ! command -v yq &>/dev/null; then
	sudo apt-get update
	sudo apt-get install -y yq
fi
# Extract the JSON array using yq
apt_packages_core_json=$(yq '.apt.core' ./linux/packages.yml)
apt_packages_essential_json=$(yq '.apt.essential' ./linux/packages.yml)
brew_packages_json=$(yq '.brew' ./linux/packages.yml)

# Convert the JSON array to a Bash array using jq
apt_packages_core=($(echo $apt_packages_core_json | jq -r '.[]'))
install_packages_with_apt "${apt_packages_core[@]}"

# Add sources of packages
source_brave
apt_packages_essential=($(echo $apt_packages_essential_json | jq -r '.[]'))
install_packages_with_apt "${apt_packages_essential[@]}"

install_packages

source ~/.bashrc
brew_packages=($(echo $brew_packages_json | jq -r '.[]'))
install_packages_with_brew "${brew_packages[@]}"

source_fish

printf "${GREEN}All installations completed.${NC}\n"
