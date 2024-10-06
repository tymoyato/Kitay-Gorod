#!/bin/bash

check_sudo() {
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
