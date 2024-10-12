#!/bin/bash

wget https://github.com/tymoyato/tmp/archive/refs/heads/main.zip

unzip main.zip

rm -f main.zip

mv Kitay-Gorod-main Kitay-Gorod

if ! cd Kitay-Gorod; then
	echo "Error: Failed to change directory to tmp"
	exit 1
fi

chmod +x ./linux_setup.sh

chmod +x ./setup.fish

chmod +x ./symlink.sh

chmod +x ./devtools/git.sh

time (

	bash -i linux_setup.sh

)

sleep 10

sudo pkill -u "$(whoami)"
