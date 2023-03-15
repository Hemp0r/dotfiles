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
cp vscode/settings.json ~/.local/share/code-server/User/settings.json &>/dev/null

# ---- INSTALL HOMEBREW ----
echo -e "${YELLOW}${PACKAGE} Installing Homebrew...${RESET}"
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)" &>/dev/null

# ---- ADD HOMEBREW TO PATH ----
echo -e "${GREEN}Adding Homebrew to PATH...${RESET}"
BREW_PATH='eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)"'
echo $BREW_PATH >> /home/coder/.profile &>/dev/null
echo $BREW_PATH >> /home/coder/.bashrc &>/dev/null

# ---- LOAD HOMEBREW ENV VARIABLES ----
echo -e "${YELLOW}Loading Homebrew environment variables...${RESET}"
eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)" &>/dev/null

# ---- INSTALL BUILD-ESSENTIAL PACKAGE ----
echo -e "${GREEN}${PACKAGE} Installing build-essential...${RESET}"
sudo apt-get install build-essential -y &>/dev/null

# ---- INSTALL GCC ----
echo -e "${YELLOW}${PACKAGE} Installing GCC...${RESET}"
brew install gcc &>/dev/null

# ---- INSTALL ZSH ----
echo -e "${GREEN}${PACKAGE} Installing Zsh...${RESET}"
brew install zsh &>/dev/null

# ---- INSTALL OH MY ZSH ----
echo -e "${YELLOW}${PACKAGE} Installing Oh My Zsh...${RESET}"
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" &>/dev/null

# ---- SET ZSH AS DEFAULT SHELL FOR CURRENT USER ----
echo -e "${GREEN}Setting Zsh as the default shell for the current user...${RESET}"
echo "export SHELL=$(which zsh)" >> ~/.bashrc &>/dev/null
echo "exec $(which zsh) -l" >> ~/.bashrc &>/dev/null

# ---- CONFIGURE GIT ----
echo -e "${GREEN}Configuring Git...${RESET}"
echo "${YELLOW}Enter your Git name:${RESET}"
read git_name
echo "${YELLOW}Enter your Git email:${RESET}"
read git_email
git config --global user.name "$git_name"
git config --global user.email "$git_email"

echo -e "${GREEN}Development environment setup complete.${RESET}"
