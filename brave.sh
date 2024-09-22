install_brave() {
  # Add Brave Browser Beta GPG key
  printf "${YELLOW}Adding Brave Browser Beta GPG key..."
  sudo curl -fsSLo /usr/share/keyrings/brave-browser-archive-keyring.gpg https://brave-browser-apt-release.s3.brave.com/brave-browser-archive-keyring.gpgbeta-archive-keyring.gpg

  # Add Brave Browser Beta repository
  printf "${YELLOW}Adding Brave Browser Beta repository..."
  echo "deb [signed-by=/usr/share/keyrings/brave-browser-archive-keyring.gpg] https://brave-browser-apt-release.s3.brave.com/ stable main"|sudo tee /etc/apt/sources.list.d/brave-browser-release.list

  # Update package lists
  printf "${YELLOW}Updating package lists..."
  sudo apt update
  # Install Brave Browser Beta
  echo "Installing Brave Browser Beta..."
  sudo apt install -y brave-browser

  echo "Brave Browser installed successfully."
}
