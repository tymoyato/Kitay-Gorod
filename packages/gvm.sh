#!/bin/bash

install_gvm() {
	check_curl
	printf "${YELLOW}Installing gvm...${NC}\n"
	bash < <(curl -sSL https://raw.githubusercontent.com/moovweb/gvm/master/binscripts/gvm-installer)
	printf "${GREEN}gvm installed successfully.${NC}\n"
}
