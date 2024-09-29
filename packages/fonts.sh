#!/bin/bash

install_fonts() {
    # Step 1: Download the font zip file from the specified URL
    printf "${YELLOW}Downloading JetBrainsMono font...${NC}\n"
    curl -L -o ~/Downloads/JetBrainsMono.zip https://github.com/ryanoasis/nerd-fonts/releases/download/v3.0.2/JetBrainsMono.zip

    # Step 2: Change to the Downloads directory
    printf "${YELLOW}Changing to the Downloads directory...${NC}\nv"
    cd ~/Downloads

    # Step 3: Unzip the downloaded font zip file
    printf "${YELLOW}Unzipping JetBrainsMono.zip...${NC}\n"
    unzip JetBrainsMono.zip -d JetBrainsMono

    # Step 4: Create the fonts directory if it doesn't exist
    printf "${YELLOW}Creating fonts directory if it doesn't exist...${NC}\n"
    mkdir -p ~/.local/share/fonts

    # Step 5: Move the Regular font file to the fonts directory
    printf "${YELLOW}Moving JetBrainsMonoNLNerdFont-Regular.ttf to the fonts directory...${NC}\n"
    mv ./JetBrainsMono/JetBrainsMonoNLNerdFont-Regular.ttf ~/.local/share/fonts

    # Step 6: Move the SemiBold font file to the fonts directory
    printf "${YELLOW}Moving JetBrainsMonoNLNerdFont-SemiBold.ttf to the fonts directory...${NC}\n"
    mv ./JetBrainsMono/JetBrainsMonoNLNerdFont-SemiBold.ttf ~/.local/share/fonts

    # Step 7: Update the font cache
    printf "${YELLOW}Updating the font cache...${NC}\n"
    fc-cache -f -v

    printf "${GREEN}Font installation complete!${NC}\n"
}