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
mkdir -p ~/.local/share/code-server/User/ && cp vscode/settings.json ~/.local/share/code-server/User/settings.json &>/dev/null

if which code-server > /dev/null; then
   code-server --install GitHub.Copilot
else
   echo "Unable to install Extensions"
fi
