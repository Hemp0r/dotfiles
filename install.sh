#!/bin/bash
# This script sets up a development environment on a Linux machine

# Color codes for text output
GREEN="\033[1;32m"
YELLOW="\033[1;33m"
RESET="\033[0m"

# Package emoji
PACKAGE="📦"

# ---- CONFIGURE VS CODE SETTINGS ----
echo -e "${GREEN}Configuring VS Code settings...${RESET}"
cp vscode/settings.json ~/.local/share/code-server/User/settings.json

# ---- INSTALL HOMEBREW ----
echo -e "${YELLOW}${PACKAGE} Installing Homebrew...${RESET}"
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

# ---- ADD HOMEBREW TO PATH ----
echo -e "${GREEN}Adding Homebrew to PATH...${RESET}"
BREW_PATH='eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)"'
echo $BREW_PATH >> /home/coder/.profile
echo $BREW_PATH >> /home/coder/.bashrc

# ---- LOAD HOMEBREW ENV VARIABLES ----
echo -e "${YELLOW}Loading Homebrew environment variables...${RESET}"
eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)"

# ---- INSTALL BUILD-ESSENTIAL PACKAGE ----
echo -e "${GREEN}${PACKAGE} Installing build-essential...${RESET}"
sudo apt-get install build-essential

# ---- INSTALL GCC ----
echo -e "${YELLOW}${PACKAGE} Installing GCC...${RESET}"
brew install gcc

# ---- INSTALL ZSH ----
echo -e "${GREEN}${PACKAGE} Installing Zsh...${RESET}"
brew install zsh

# ---- INSTALL OH MY ZSH ----
echo -e "${YELLOW}${PACKAGE} Installing Oh My Zsh...${RESET}"
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

# ---- SET ZSH AS DEFAULT SHELL FOR CURRENT USER ----
echo -e "${GREEN}Setting Zsh as the default shell for the current user...${RESET}"
echo "export SHELL=$(which zsh)" >> ~/.bashrc
echo "exec $(which zsh) -l" >> ~/.bashrc

echo -e "${GREEN}Development environment setup complete.${RESET}"