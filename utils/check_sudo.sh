#!/bin/bash

check_sudo() {
    printf "${YELLOW}Checking if the user has sudo privileges...${NC}\n"

    # Check if the user has sudo privileges
    if ! sudo -n true 2>/dev/null; then
        printf "${YELLOW}User does not have sudo privileges. Adding user to sudoers...${NC}\n"

        if [[ "$OS" == "Linux" ]]; then
            sudo_user=$(whoami)
            sudo_command="echo '$sudo_user ALL=(ALL) NOPASSWD:ALL' >> /etc/sudoers"

            # Add the user to sudoers
            if ! su -c "$sudo_command"; then
                printf "${RED}Failed to add user to sudoers.${NC}\n"
                return 1
            fi
        else
            printf "${RED}Unsupported operating system for adding sudo privileges: ${OS}${NC}\n"
            return 1
        fi
    else
        printf "${GREEN}User has sudo privileges.${NC}\n"
    fi

    return 0
}