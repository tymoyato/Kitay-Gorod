#!/bin/bash

# Prompt for the root password and switch to the root user
echo "Please enter the root password to proceed:"
su -c "echo 'Switching to root user...'"

# Open the /etc/sudoers file with visudo (safe way to edit sudoers)
su -c "visudo"

# Add the current user to the sudoers file
CURRENT_USER=$(whoami)
su -c "echo '$CURRENT_USER ALL=(ALL:ALL) ALL' >> /etc/sudoers"

# Exit the su session
su -c "exit"

echo "The current user has been added to the sudoers file."
