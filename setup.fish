#!/home/linuxbrew/.linuxbrew/bin/fish

fisher list | fisher install
fisher list | fisher update
rbenv install 3.3.0
rbenv global 3.3.0
gem install bundler
nvm install latest
gvm install go1.23.2

exec fish
