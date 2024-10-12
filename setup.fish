#!/home/linuxbrew/.linuxbrew/bin/fish

fisher list | fisher install > /dev/null
fisher list | fisher update > /dev/null
rbenv install 3.3.0 > /dev/null
rbenv global 3.3.0 > /dev/null
gem install bundler > /dev/null

exec fish

