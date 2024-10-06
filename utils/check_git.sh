#!/bin/bash

check_git() {
	if ! command -v git &>/dev/null; then
		printf "${YELLOW}git is not installed.${NC}\n"
		exit 1
	fi
}
