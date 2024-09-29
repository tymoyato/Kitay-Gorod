#!/bin/bash

install_kitty() {
    check_curl
    printf "${YELLOW}Installing kitty...${NC}\n"

    # Download and run the kitty installer script
    if ! curl -L https://sw.kovidgoyal.net/kitty/installer.sh | sh /dev/stdin; then
        printf "${RED}Failed to install kitty.${NC}\n"
        return 1
    fi

    # Create symbolic links to add kitty and kitten to PATH (assuming ~/.local/bin is in your system-wide PATH)
    if ! sudo ln -sf ~/.local/kitty.app/bin/kitty ~/.local/kitty.app/bin/kitten /usr/bin/; then
        printf "${RED}Failed to create symbolic links for kitty and kitten.${NC}\n"
        return 1
    fi

    # Place the kitty.desktop file somewhere it can be found by the OS
    if ! cp ~/.local/kitty.app/share/applications/kitty.desktop ~/.local/share/applications/; then
        printf "${RED}Failed to copy kitty.desktop file.${NC}\n"
        return 1
    fi

    # If you want to open text files and images in kitty via your file manager also add the kitty-open.desktop file
    if ! cp ~/.local/kitty.app/share/applications/kitty-open.desktop ~/.local/share/applications/; then
        printf "${RED}Failed to copy kitty-open.desktop file.${NC}\n"
        return 1
    fi

    # Update the paths to the kitty and its icon in the kitty desktop file(s)
    if ! sed -i "s|Icon=kitty|Icon=$(readlink -f ~)/.local/kitty.app/share/icons/hicolor/256x256/apps/kitty.png|g" ~/.local/share/applications/kitty*.desktop; then
        printf "${RED}Failed to update the icon path in kitty desktop files.${NC}\n"
        return 1
    fi

    if ! sed -i "s|Exec=kitty|Exec=$(readlink -f ~)/.local/kitty.app/bin/kitty|g" ~/.local/share/applications/kitty*.desktop; then
        printf "${RED}Failed to update the exec path in kitty desktop files.${NC}\n"
        return 1
    fi

    # Make xdg-terminal-exec (and hence desktop environments that support it use kitty)
    if ! echo 'kitty.desktop' > ~/.config/xdg-terminals.list; then
        printf "${RED}Failed to set kitty as the default terminal.${NC}\n"
        return 1
    fi

    printf "${GREEN}kitty installed successfully.${NC}\n"
    return 0
}