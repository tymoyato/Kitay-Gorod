#!/bin/bash

# Make each script executable
chmod +x os.sh
chmod +x sudo.sh
chmod +x linux.sh
chmod +x fonts.sh
chmod +x homebrew.sh
chmod +x packages.sh
chmod +x nvchad.sh
chmod +x kitty.sh

# Run os.sh
./os.sh

# Run linux.sh
./linux.sh

# Run kitty.sh
./kitty.sh

# Run sudo.sh
./sudo.sh

# Run fonts.sh
./fonts.sh

# Run homebrew.sh
./homebrew.sh

# Source .bashrc
source ~/.bashrc

# Run packages.sh
./packages.sh

# Run nvchad.sh
./nvchad.sh
