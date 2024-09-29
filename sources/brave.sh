#!/bin/bash

source_brave() {
  check_curl
  # Add Brave Browser GPG key
  printf "${YELLOW}Adding Brave Browser Beta GPG key..."
  if ! sudo curl -fsSLo /usr/share/keyrings/brave-browser-archive-keyring.gpg https://brave-browser-apt-release.s3.brave.com/brave-browser-archive-keyring.gpgbeta-archive-keyring.gpg
    printf "${YELLOW}Failed to add Brave Browser Beta GPG key.${NC}\n"
    exit 1
  fi
  # Add Brave Browser repository
  printf "${YELLOW}Adding Brave Browser Beta repository..."
  echo "deb [signed-by=/usr/share/keyrings/brave-browser-archive-keyring.gpg] https://brave-browser-apt-release.s3.brave.com/ stable main"|sudo tee /etc/apt/sources.list.d/brave-browser-release.list
}