#!/bin/bash

source ./colors.sh
source ./os.sh

# Check if the user is in the sudoers file
check_sudo() {
    printf "${YELLOW}Checking if the user has sudo privileges...${NC}\n"
    if ! sudo -n true 2>/dev/null; then
        printf "${YELLOW}User does not have sudo privileges. Adding user to sudoers...${NC}\n"
        if [[ "$OS" == "Linux" ]]; then
            sudo_user=$(whoami)
            sudo_command="echo '$sudo_user ALL=(ALL) NOPASSWD:ALL' >> /etc/sudoers"
            su -c "$sudo_command"
        else
            printf "${RED}Unsupported operating system for adding sudo privileges: ${OS}${NC}\n"
            exit 1
        fi
    else
        printf "${GREEN}User has sudo privileges.${NC}\n"
    fi
}
