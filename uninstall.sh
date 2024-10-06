#!/bin/bash

# Remove the /opt/homebrew directory itself
sudo rm -rf /opt/homebrew/

# Function to uninstall packages with brew
brew list
brew list | xargs brew uninstall -f
brew cleanup

/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/uninstall.sh)"

# List of directories to remove
directories=(
	"/opt/homebrew/Frameworks/"
	"/opt/homebrew/bin/"
	"/opt/homebrew/etc/"
	"/opt/homebrew/include/"
	"/opt/homebrew/lib/"
	"/opt/homebrew/opt/"
	"/opt/homebrew/sbin/"
	"/opt/homebrew/share/"
	"/opt/homebrew/var/"
	"/home/linuxbrew/.linuxbrew/etc/"
	"/home/linuxbrew/.linuxbrew/lib/"
)

# Loop through each directory and remove it
for dir in "${directories[@]}"; do
	sudo rm -rf "$dir"
done

echo "Directories removed successfully."

# Function to uninstall packages with apt
uninstall_packages_with_apt() {
	# Update package lists
	printf '%sUpdating package lists%s\n' "${YELLOW}" "${NC}"
	sudo apt update
	printf '%sUninstalling packages with apt...%s\n' "${YELLOW}" "${NC}"
	for package in "$@"; do
		printf "${YELLOW}Uninstalling %s...${NC}\n" "$package"
		sudo apt remove -y "$package"
	done
	printf '%sAll packages uninstalled successfully.%s\n' "${GREEN}" "${NC}"
}

# List of packages to uninstall
packages_to_uninstall=(build-essential git curl brave-browser)

# Call the function with the list of packages to uninstall
uninstall_packages_with_apt "${packages_to_uninstall[@]}"
