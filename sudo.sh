#!/bin/bash

source ./colors.sh
source ./os.sh

setup_root() {
  # Check if the script is run as root
  if [ "$EUID" -ne 0 ]; then
    printf "${RED}Please run as root${NC}\n"
    exit 1
  fi

  # Check if there are any sudo users
  if ! grep -q '^[^#;]' /etc/sudoers; then
    # Add the current user to the sudoers file
    echo "ervin ALL=(ALL:ALL) ALL" >> /etc/sudoers
    printf "${YELLOW}User ervin added to /etc/sudoers${NC}\n"
  else
    printf "${GREEN}Sudo users already exist. No changes made.${NC}\n"
  fi
}