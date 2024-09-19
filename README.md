#!/bin/bash

# Make each script executable
chmod +x sudo.sh
chmod +x install.sh
chmod +x packages.sh
chmod +x fonts.sh
chmod +x nvchad.sh

su


echo "ervin ALL=(ALL:ALL) ALL" >> /etc/sudoers
exit
# Run sudo.sh
./sudo.sh

# Run install.sh
./install.sh

# Source .bashrc
source ~/.bashrc

# Run packages.sh
./packages.sh

# Run fonts.sh
./fonts.sh

# Run nvchad.sh
./nvchad.sh
