#!/bin/bash

install_spotube() {
	check_curl
	print_message "Installing spotube..." "instruction"
  wget https://github.com/KRTirtho/spotube/releases/latest/download/Spotube-linux-x86_64.deb
  sudo apt install ./Spotube-linux-x86_64.deb -y
  rm -rf Spotube-linux-x86_64.deb
	print_message "spotube installed successfully." "success"
}
