#!/bin/bash
# This script sets up a development environment on a Linux machine

# ---- CONFIGURE VS CODE SETTINGS ----
echo "Configuring VS Code settings..."
cp vscode/settings.json ~/.local/share/code-server/User/settings.json

# ---- INSTALL HOMEBREW ----
echo "Installing Homebrew..."
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

# ---- ADD HOMEBREW TO PATH ----
echo "Adding Homebrew to PATH..."
BREW_PATH='eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)"'
echo $BREW_PATH >> /home/coder/.profile
echo $BREW_PATH >> /home/coder/.bashrc

# ---- LOAD HOMEBREW ENV VARIABLES ----
echo "Loading Homebrew environment variables..."
eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)"

# ---- INSTALL BUILD-ESSENTIAL PACKAGE ----
echo "Installing build-essential..."
sudo apt-get install build-essential

# ---- INSTALL GCC ----
echo "Installing GCC..."
brew install gcc

# ---- INSTALL ZSH ----
echo "Installing Zsh..."
brew install zsh

# ---- INSTALL OH MY ZSH ----
echo "Installing Oh My Zsh..."
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

echo "Development environment setup complete."