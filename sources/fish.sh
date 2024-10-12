#!/bin/bash

source_fish() {
	print_message "Add fish shell..." "instruction"
	sudo add-shell /home/linuxbrew/.linuxbrew/bin/fish
	check_command "sudo add-shell /home/linuxbrew/.linuxbrew/bin/fish"

	print_message "Set fish shell default..." "instuction"
	chsh -s /home/linuxbrew/.linuxbrew/bin/fish
	check_command "chsh -s /home/linuxbrew/.linuxbrew/bin/fish"

	print_message "All commands succeeded." "success"
}
