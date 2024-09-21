#!/bin/bash

# Make each script executable
chmod +x os.sh
chmod +x sudo.sh
chmod +x linux.sh
chmod +x packages.sh
chmod +x fonts.sh

su
echo "ervin ALL=(ALL:ALL) ALL" >> /etc/sudoers

# Run os.sh
./os.sh

# Run sudo.sh
./sudo.sh

# Run install.sh
./linux.sh

# Source .bashrc
source ~/.bashrc

# Run fonts.sh
./fonts.sh

# Run packages.sh
./packages.sh
