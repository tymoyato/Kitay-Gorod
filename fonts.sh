#!/bin/bash

# Step 1: Download the font zip file from the specified URL
echo "Downloading JetBrainsMono font..."
curl -L -o ~/Downloads/JetBrainsMono.zip https://github.com/ryanoasis/nerd-fonts/releases/download/v3.0.2/JetBrainsMono.zip

# Step 2: Change to the Downloads directory
echo "Changing to the Downloads directory..."
cd ~/Downloads

# Step 3: Unzip the downloaded font zip file
echo "Unzipping JetBrainsMono.zip..."
unzip JetBrainsMono.zip -d JetBrainsMono

# Step 4: Create the fonts directory if it doesn't exist
echo "Creating fonts directory if it doesn't exist..."
mkdir -p ~/.local/share/fonts

# Step 5: Move the Regular font file to the fonts directory
echo "Moving JetBrainsMonoNLNerdFont-Regular.ttf to the fonts directory..."
mv ./JetBrainsMono/JetBrainsMonoNLNerdFont-Regular.ttf ~/.local/share/fonts

# Step 6: Move the SemiBold font file to the fonts directory
echo "Moving JetBrainsMonoNLNerdFont-SemiBold.ttf to the fonts directory..."
mv ./JetBrainsMono/JetBrainsMonoNLNerdFont-SemiBold.ttf ~/.local/share/fonts

# Step 7: Update the font cache
echo "Updating the font cache..."
fc-cache -f -v

echo "Font installation complete!"
