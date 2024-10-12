#!/bin/bash

install_fonts() {
	# Step 1: Download the font zip file from the specified URL
	print_message "Downloading JetBrainsMono font..." "instruction"
	curl -L -o ~/Downloads/JetBrainsMono.zip https://github.com/ryanoasis/nerd-fonts/releases/download/v3.0.2/JetBrainsMono.zip

	# Step 2: Change to the Downloads directory
	print_message "Changing to the Downloads directory..." "instruction"

	if ! cd ~/Downloads; then
		print_message "Error: Failed to change directory to ~/Downloads" "instruction"
		exit 1
	fi

	# Step 3: Unzip the downloaded font zip file
	print_message "Unzipping JetBrainsMono.zip..." "instruction"
	unzip JetBrainsMono.zip -d JetBrainsMono

	# Step 4: Create the fonts directory if it doesn't exist
	print_message "Creating fonts directory if it doesn't exist..." "instruction"
	mkdir -p ~/.local/share/fonts

	# Step 5: Move the Regular font file to the fonts directory
	print_message "Moving JetBrainsMonoNLNerdFont-Regular.ttf to the fonts directory..." "instruction"
	mv ./JetBrainsMono/JetBrainsMonoNLNerdFont-Regular.ttf ~/.local/share/fonts

	# Step 6: Move the SemiBold font file to the fonts directory
	print_message "Moving JetBrainsMonoNLNerdFont-SemiBold.ttf to the fonts directory..." "instruction"
	mv ./JetBrainsMono/JetBrainsMonoNLNerdFont-SemiBold.ttf ~/.local/share/fonts

	# Step 7: Update the font cache
	print_message "Updating the font cache..." "instruction"
	fc-cache -f -v

	print_message "Font installation complete!" "instruction"
}
