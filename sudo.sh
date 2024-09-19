#!/bin/bash

# Get the current user
CURRENT_USER=$(whoami)

# Prompt for the root password
read -sp "Enter root password: " ROOT_PASSWORD
echo

# Use su to gain root privileges and add the current user to the sudoers file using visudo
echo "$ROOT_PASSWORD" | su -c "echo '$CURRENT_USER ALL=(ALL:ALL) ALL' | EDITOR='tee -a' visudo"

# Check if the operation was successful
if [ $? -eq 0 ]; then
    echo "User $CURRENT_USER has been added to /etc/sudoers successfully."
else
    echo "Failed to add user $CURRENT_USER to /etc/sudoers."
fi
