# Function to install packages with brew
install_packages_with_brew() {
    printf "${YELLOW}Installing packages with Homebrew...${NC}\n"
    for package in "$@"; do
        printf "${YELLOW}Installing $package...${NC}\n"
        brew install "$package"
    done
    printf "${GREEN}All packages installed successfully.${NC}\n"
}

install_packages_with_brew rbenv nvm fish eza btop atuin jless difftastic bat fzf zoxide neovim fisher ripgrep nvim unzip

# Function to install packages
install_packages() {
    printf "${YELLOW}Installing packages...${NC}\n"
    printf "${YELLOW}Installing kitty...${NC}\n"
    curl -L https://sw.kovidgoyal.net/kitty/installer.sh | sh /dev/stdin
    printf "${GREEN}All packages installed successfully.${NC}\n"
}
