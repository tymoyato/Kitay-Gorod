# Function to install packages with brew
install_packages_with_brew() {
    printf "${YELLOW}Installing packages with Homebrew...${NC}\n"
    for package in "$@"; do
        printf "${YELLOW}Installing $package...${NC}\n"
        brew install "$package"
    done
    printf "${GREEN}All packages installed successfully.${NC}\n"
}

install_packages_with_brew rbenv nvm
