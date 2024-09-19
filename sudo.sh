#!/bin/bash

# Check if the script is run as root
if [ "$EUID" -ne 0 ]; then
  echo "Please run as root"
  exit 1
fi

# Check if there are any sudo users
if ! grep -q '^[^#;]' /etc/sudoers; then
  # Add the current user to the sudoers file
  echo "ervin ALL=(ALL:ALL) ALL" >> /etc/sudoers
  echo "User ervin added to /etc/sudoers"
else
  echo "Sudo users already exist. No changes made."
fi
