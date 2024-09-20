#!/bin/bash

# Make each script executable
chmod +x sudo.sh
chmod +x linux.sh
chmod +x packages.sh
chmod +x fonts.sh
chmod +x nvchad.sh

su
echo "ervin ALL=(ALL:ALL) ALL" >> /etc/sudoers

# Run sudo.sh
./sudo.sh

# Run install.sh
./linux.sh

# Source .bashrc
source ~/.bashrc

# Run packages.sh
./packages.sh

# Run fonts.sh
./fonts.sh

# Run nvchad.sh
./nvchad.sh
