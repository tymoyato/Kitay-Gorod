# rm -rf ~/.config/fish
# ln -sf ~/tmp/fish ~/.config/

# rm -rf ~/.config/kitty
# ln -sf ~/tmp/kitty ~/.config/

# rm -rf ~/.config/BraveSoftware/Brave-Browser/Default/Preferences
# ln -sf ~/tmp/Preferences ~/.config/BraveSoftware/Brave-Browser/Default/

# rm -rf ~/.config/nvim
# ln -sf ~/tmp/nvim ~/.config/

# Define an array of source and target pairs
declare -a configs=(
    "fish ~/.config/fish"
    "kitty ~/.config/kitty"
    "Preferences ~/.config/BraveSoftware/Brave-Browser/Default/Preferences"
    "nvim ~/.config/nvim"
)

# Iterate over each pair
for config in "${configs[@]}"; do
    # Split the pair into source and target
    IFS=' ' read -r src tgt <<< "$config"

    # Remove the target directory or file
    rm -rf "$tgt"

    # Create a symbolic link from the source to the target
    ln -sf "~/tmp/dotfiles/$src" "$tgt"
done

# fish linux
set -Ux fish_user_paths /home/linuxbrew/.linuxbrew/bin $fish_user_paths
#go
bash < <(curl -sSL https://raw.githubusercontent.com/moovweb/gvm/master/binscripts/gvm-installer)
sudo apt-get install zlib1g-dev
rbenv install 3.3.0
rbenv global 3.3.0
gem install bundler
