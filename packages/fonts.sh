#!/bin/bash

install_fonts() {
	# Step 1: Download the font zip file from the specified URL
	printf '%sDownloading JetBrainsMono font...%s\n' "${YELLOW}" "${NC}"
	curl -L -o ~/Downloads/JetBrainsMono.zip https://github.com/ryanoasis/nerd-fonts/releases/download/v3.0.2/JetBrainsMono.zip

	# Step 2: Change to the Downloads directory
	printf '%sChanging to the Downloads directory...%s\n' "${YELLOW}" "${NC}"

	if ! cd ~/Downloads; then
		echo "Error: Failed to change directory to ~/Downloads"
		exit 1
	fi

	# Step 3: Unzip the downloaded font zip file
	printf '%sUnzipping JetBrainsMono.zip...%s\n' "${YELLOW}" "${NC}"
	unzip JetBrainsMono.zip -d JetBrainsMono

	# Step 4: Create the fonts directory if it doesn't exist
	printf "%sCreating fonts directory if it doesn't exist...%s\n" "${YELLOW}" "${NC}"
	mkdir -p ~/.local/share/fonts

	# Step 5: Move the Regular font file to the fonts directory
	printf "%sMoving JetBrainsMonoNLNerdFont-Regular.ttf to the fonts directory...%s\n" "${YELLOW}" "${NC}"
	mv ./JetBrainsMono/JetBrainsMonoNLNerdFont-Regular.ttf ~/.local/share/fonts

	# Step 6: Move the SemiBold font file to the fonts directory
	printf "%sMoving JetBrainsMonoNLNerdFont-SemiBold.ttf to the fonts directory...%s\n" "${YELLOW}" "${NC}"
	mv ./JetBrainsMono/JetBrainsMonoNLNerdFont-SemiBold.ttf ~/.local/share/fonts

	# Step 7: Update the font cache
	printf "%sUpdating the font cache...%s\n" "${YELLOW}" "${NC}"
	fc-cache -f -v

	printf "%sFont installation complete!%s\n" "${GREEN}" "${NC}"
}
