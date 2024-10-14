#!/home/linuxbrew/.linuxbrew/bin/fish

fisher list | fisher install
fisher list | fisher update
rbenv install 3.3.0
rbenv global 3.3.0
gem install bundler
nvm install latest

exec fish
