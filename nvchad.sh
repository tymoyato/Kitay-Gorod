#!/bin/bash

# Define the directory path
nvim_config_dir="$HOME/.config/nvim"

# Check if the directory exists
if [ -d "$nvim_config_dir" ]; then
  echo "The directory $nvim_config_dir already exists."
else
  echo "The directory $nvim_config_dir does not exist. Cloning the repository..."
  git clone https://github.com/NvChad/starter "$nvim_config_dir"
  echo "Repository cloned successfully. Starting nvim..."
  nvim
fi
