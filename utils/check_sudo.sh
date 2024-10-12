#!/bin/bash

#!/bin/bash

# Define colors
YELLOW='\033[1;33m'
GREEN='\033[1;32m'
RED='\033[1;31m'
NC='\033[0m' # No Color (reset)

# Function to print a message with color based on message type
print_message() {
    local message=$1
    local type=$2

    case $type in
        instruction)
            printf "${YELLOW}%s${NC}\n" "$message"
            ;;
        success)
            printf "${GREEN}%s${NC}\n" "$message"
            ;;
        fail)
            printf "${RED}%s${NC}\n" "$message"
            ;;
        *)
            printf "%s\n" "$message"  # No color for unknown types
            ;;
    esac
}

# Example usage
print_message "Checking if the user has sudo privileges..." "instruction"
print_message "User has sudo privileges!" "success"
print_message "Failed to obtain sudo privileges." "fail"


check_sudo() {
	print_message("Checking if the user has sudo privileges", "instrcution")
	printf '%sChecking if the user has sudo privileges...%s\n' "${YELLOW}" "${NC}"

	# Check if the user has sudo privileges
	if ! sudo -n true 2>/dev/null; then
		printf '%sUser does not have sudo privileges. Adding user to sudoers...%s\n' "${YELLOW}" "${NC}"

		if [[ "$OS" == "Linux" ]]; then
			sudo_user=$(whoami)
			sudo_command="echo '$sudo_user ALL=(ALL) NOPASSWD:ALL' >> /etc/sudoers"

			# Add the user to sudoers
			printf '%senter superuser password%s\n' "${YELLOW}" "${NC}"
			if ! su -c "$sudo_command"; then
				printf '%sFailed to add user to sudoers.%s\n' "${RED}" "${NC}"
				return 1
			fi
		else
			printf '%sUnsupported operating system for adding sudo privileges: %s%s\n' "${RED}" "${OS}" "${NC}"
			return 1
		fi
	else
		printf '%sUser has sudo privileges.%s\n' "${GREEN}" "${NC}"
	fi

	return 0
}
