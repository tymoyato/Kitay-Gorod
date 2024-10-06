wget https://github.com/tymoyato/tmp/archive/refs/heads/main.zip

unzip main.zip

rm -f main.zip

mv tmp-main tmp

cd tmp

chmod +x ./linux_setup.sh

chmod +x ./fish.sh

chmod +x ./symlink.sh

time (

	bash -i linux_setup.sh

)

sleep 10

sudo pkill -u $(whoami)
