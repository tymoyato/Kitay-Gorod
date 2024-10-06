#!/bin/bash

source_fish() {
	printf '%sAdd fish shell...%s\n' "${YELLOW}" "${NC}"
	sudo add-shell /home/linuxbrew/.linuxbrew/bin/fish
	check_command "sudo add-shell /home/linuxbrew/.linuxbrew/bin/fish"

	printf '%sSet fish shell default...%s\n' "${YELLOW}" "${NC}"
	chsh -s /home/linuxbrew/.linuxbrew/bin/fish
	check_command "chsh -s /home/linuxbrew/.linuxbrew/bin/fish"

	printf '%sAll commands succeeded.%s\n' "${GREEN}" "${NC}"
}
