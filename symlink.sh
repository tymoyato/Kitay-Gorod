# rm -rf ~/.config/fish
# ln -sf ~/tmp/fish ~/.config/

# rm -rf ~/.config/kitty
# ln -sf ~/tmp/kitty ~/.config/

# rm -rf ~/.config/BraveSoftware/Brave-Browser/Default/Preferences
# ln -sf ~/tmp/Preferences ~/.config/BraveSoftware/Brave-Browser/Default/

# rm -rf ~/.config/nvim
# ln -sf ~/tmp/nvim ~/.config/

# Function to remove and link configuration files
setup_configs() {
    local config_dir="$HOME/.config"
    local tmp_dir="$HOME/tmp/dotfiles"

    # List of configuration directories and files
    local configs=(
        "fish"
        "kitty"
        "nvim"
        "BraveSoftware/Brave-Browser/Default/Preferences"
    )

    # Remove existing configurations
    for config in "${configs[@]}"; do
        rm -rf "$config_dir/$config"
    done

    # Create symbolic links
    for config in "${configs[@]}"; do
        ln -sf "$tmp_dir/$config" "$config_dir/$config"
    done

    echo "Configurations have been set up."
}

# Call the function
setup_configs

# fish linux
set -Ux fish_user_paths /home/linuxbrew/.linuxbrew/bin $fish_user_paths
#go
bash < <(curl -sSL https://raw.githubusercontent.com/moovweb/gvm/master/binscripts/gvm-installer)
sudo apt-get install zlib1g-dev
rbenv install 3.3.0
rbenv global 3.3.0
gem install bundler
