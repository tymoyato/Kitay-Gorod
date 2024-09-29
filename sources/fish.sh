#!/bin/bash

source_fish() {
  printf "${YELLOW}add fish shell...${NC}\n"
  sudo add-shell /home/linuxbrew/.linuxbrew/bin/fish
  check_command "sudo add-shell /home/linuxbrew/.linuxbrew/bin/fish"

  printf "${YELLOW}set fish shell default...${NC}\n"
  chsh -s /home/linuxbrew/.linuxbrew/bin/fish
  check_command "chsh -s /home/linuxbrew/.linuxbrew/bin/fish"

  printf "${GREEN}All commands succeeded.${NC}\n"
}