rm -rf ~/.config/fish
ln -sf ~/tmp/fish ~/.config/

rm -rf ~/.config/kitty
ln -sf ~/tmp/kitty ~/.config/

rm -rf ~/.config/BraveSoftware/Brave-Browser/Default/Preferences
ln -sf ~/tmp/Preferences ~/.config/BraveSoftware/Brave-Browser/Default/

rm -rf ~/.config/nvim
ln -sf ~/tmp/nvim ~/.config/

# fish linux
set -Ux fish_user_paths /home/linuxbrew/.linuxbrew/bin $fish_user_paths
#go
bash < <(curl -s -S -L https://raw.githubusercontent.com/moovweb/gvm/master/binscripts/gvm-installer)
