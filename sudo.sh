#!/bin/bash

# Check if the script is run as root
if [ "$EUID" -ne 0 ]; then
  echo "Please run as root"
  exit 1
fi

# Get the current user
current_user=ervin

# Check if there are any sudo users
if ! grep -q '^[^#;]' /etc/sudoers; then
  # Add the current user to the sudoers file
  echo "$current_user ALL=(ALL:ALL) ALL" >> /etc/sudoers
  echo "User $current_user added to /etc/sudoers"
else
  echo "Sudo users already exist. No changes made."
fi
