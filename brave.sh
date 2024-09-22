install_brave() {
  # Check if curl is installed
  if ! command -v curl &> /dev/null; then
    printf "${YELLOW}curl is not installed. Installing curl..."
    sudo apt update
    sudo apt install -y curl
  fi

  # Add Brave Browser Beta GPG key
  printf "${YELLOW}Adding Brave Browser Beta GPG key..."
  sudo curl -fsSLo /usr/share/keyrings/brave-browser-beta-archive-keyring.gpg https://brave-browser-apt-beta.s3.brave.com/brave-browser-beta-archive-keyring.gpg

  # Add Brave Browser Beta repository
  printf "${YELLOW}Adding Brave Browser Beta repository..."
  echo "deb [signed-by=/usr/share/keyrings/brave-browser-beta-archive-keyring.gpg] https://brave-browser-apt-beta.s3.brave.com/ stable main" | sudo tee /etc/apt/sources.list.d/brave-browser-beta.list

  # Update package lists
  printf "${YELLOW}Updating package lists..."
  sudo apt update
  # Install Brave Browser Beta
  echo "Installing Brave Browser Beta..."
  sudo apt install -y brave-browser-beta

  echo "Brave Browser Beta installed successfully."
}
