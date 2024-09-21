#!/bin/bash

source ./colors.sh
source ./os.sh

install_nvchad() {
  # Define the directory path
  nvim_config_dir="$HOME/.config/nvim"

  # Check if the directory exists
  if [ -d "$nvim_config_dir" ]; then
    printf "${RED}The directory $nvim_config_dir already exists.${NC}\n"
  else
    printf "${YELLOW}The directory $nvim_config_dir does not exist. Cloning the repository...${NC}\n"
    git clone https://github.com/NvChad/starter "$nvim_config_dir"
    printf "${GREEN}Repository cloned successfully.${NC}\n"
  fi
}
