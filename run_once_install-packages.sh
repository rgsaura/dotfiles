#!/bin/bash

# Navigate to the home directory
cd "$HOME" || exit

# Determine the system type
system_type=$(uname -s)


common_instructions() {
  git clone https://github.com/NvChad/NvChad ~/.config/nvim --depth 1 && nvim
  curl -sS https://webi.sh/lsd | sh
  curl -sS https://webi.sh/bat | sh

  
}

if [ "$system_type" == "Darwin" ]; then
  echo "Installing Packages › Mac"
  brew install $(awk '!/^#/ {print $1}' ~/.local/share/chezmoi/pkglist.txt) 2>/dev/null
  brew install neovim

  # Additional Mac-specific settings
  # defaults write com.apple.dock workspaces-auto-swoosh -bool NO
  # defaults write NSGlobalDomain ApplePressAndHoldEnabled -bool false
  # defaults write com.apple.screencapture location ~/Pictures/Screenshots
common_instructions
  common_instructions

elif [ "$system_type" == "Linux" ]; then
  echo "Installing Packages › Linux"
  sudo apt install -y $(awk '!/^#/ {print $1}' ~/.local/share/chezmoi/pkglist.txt) 2>/dev/null
  sudo apt-get install -y $(awk '!/^#/ {print $1}' ~/.local/share/chezmoi/pkglist.txt) 2>/dev/null
  sudo apt update -y 
  sudo snap install --beta nvim --classic
  sudo apt install bspwm sxhkd


  common_instructions

else
  echo "Unsupported system type: $system_type"
  exit 1
fi


