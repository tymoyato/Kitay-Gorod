#!/bin/bash

# Get the current username
CURRENT_USER=$(whoami)

# Check if the user is already in the sudoers file
if sudo grep -q "^${CURRENT_USER} " /etc/sudoers; then
  echo "User ${CURRENT_USER} is already in the sudoers file."
  exit 0
fi

# Add the current user to the sudoers file
echo "${CURRENT_USER} ALL=(ALL:ALL) ALL" | sudo EDITOR='tee -a' visudo

# Check if the user was added successfully
if sudo grep -q "^${CURRENT_USER} " /etc/sudoers; then
  echo "User ${CURRENT_USER} has been added to the sudoers file."
else
  echo "Failed to add user ${CURRENT_USER} to the sudoers file."
  exit 1
fi
