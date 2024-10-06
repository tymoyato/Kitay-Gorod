#!/bin/bash

wget https://github.com/tymoyato/tmp/archive/refs/heads/main.zip

unzip main.zip

rm -f main.zip

mv tmp-main tmp

if ! cd tmp; then
	echo "Error: Failed to change directory to tmp"
	exit 1
fi

chmod +x ./linux_setup.sh

chmod +x ./setup.fish

chmod +x ./symlink.sh

time (

	bash -i linux_setup.sh

)

sleep 10

sudo pkill -u "$(whoami)"
