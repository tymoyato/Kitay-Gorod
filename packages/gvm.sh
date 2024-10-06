#!/bin/bash

install_gvm() {
	check_curl
	printf '%sInstalling gvm...%s\n' "${YELLOW}" "${NC}"
	bash < <(curl -sSL https://raw.githubusercontent.com/moovweb/gvm/master/binscripts/gvm-installer)
	printf '%sgvm installed successfully.%s\n' "${GREEN}" "${NC}"
}
