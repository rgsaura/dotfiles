#!/bin/bash

# Navigate to the home directory
cd "$HOME" || exit


# Determine the system type
system_type=$(uname -s)

if[ "$system_type" == "Darwin" ]; then
  echo "Updating Packages › Mac"
  # Fix that zsh nonsense
  brew install $(awk '!/^#/ {print $1}' ~/.local/share/chezmoi/pkglist.txt) 2>/dev/null

  # Additional Mac-specific settings
  # defaults write com.apple.dock workspaces-auto-swoosh -bool NO
  # defaults write NSGlobalDomain ApplePressAndHoldEnabled -bool false
  # defaults write com.apple.screencapture location ~/Pictures/Screenshots

  # git config --global core.excludesfile ~/.gitignore
  # sudo chsh -s /usr/local/bin/bash "$USER"
  # cd ~/bin/setup

elif [ "$system_type" == "Linux" ]; then
  echo "Updating Packages › Linux"
  sudo apt install -y $(awk '!/^#/ {print $1}' ~/.local/share/chezmoi/pkglist.txt) 2>/dev/null
  sudo apt-get install -y $(awk '!/^#/ {print $1}' ~/.local/share/chezmoi/pkglist.txt) 2>/dev/null

   sudo apt update -y 
  

elif [ "$system_type" == "Windows_NT" ]; then
  echo "Updating Packages › Windows"
  # Add Windows-specific package update commands here
else
  echo "Unsupported system type: $system_type"
  exit 1
fi
