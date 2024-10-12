#!/bin/bash

install_gvm() {
	check_curl
	print_message "Installing gvm..." "instruction"
	bash < <(curl -sSL https://raw.githubusercontent.com/moovweb/gvm/master/binscripts/gvm-installer)
	print_message "gvm installed successfully." "success"
}
