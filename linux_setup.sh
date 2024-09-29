#!/bin/bash

. ./utils/colors.sh
. ./utils/check_sudo.sh
. ./apt_install_packages.sh
. ./brew_install_packages.sh
. ./utils/os.sh
. ./packages/fonts.sh
. ./packages/kitty.sh
. ./packages/nvchad.sh
. ./packages/homebrew.sh
. ./packages/main.sh
. ./sources/fish.sh

check_sudo

if ! command -v yq &> /dev/null; then
    sudo apt-get update
    sudo apt-get install -y yq
fi
# Extract the JSON array using yq
apt_packages_json=$(yq '.apt' ./packages.yml)
brew_packages_json=$(yq '.brew' ./packages.yml)

# Convert the JSON array to a Bash array using jq
apt_packages=($(echo $apt_packages_json | jq -r '.[]'))
install_packages_with_apt "${apt_packages[@]}"

install_packages

source ~/.bashrc
brew_packages=($(echo $brew_packages_json | jq -r '.[]'))
install_packages_with_brew "${brew_packages[@]}"

source_fish

printf "${GREEN}All installations completed.${NC}\n"
