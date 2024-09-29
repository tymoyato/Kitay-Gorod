#!/bin/bash

check_curl() {
  if ! command -v curl &> /dev/null; then
    printf "${YELLOW}curl is not installed.${NC}\n"
    exit 1
  fi
}