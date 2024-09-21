#!/bin/bash

# Make each script executable
chmod +x os.sh
chmod +x sudo.sh
chmod +x linux.sh
chmod +x fonts.sh
chmod +x homebrew.sh
chmod +x packages.sh

# Run os.sh
./os.sh

# Run install.sh
./linux.sh

# Run sudo.sh
./sudo.sh

# Run homebrew.sh
./homebrew.sh

# Source .bashrc
source ~/.bashrc

# Run packages.sh
./packages.sh

# Run fonts.sh
./fonts.sh

