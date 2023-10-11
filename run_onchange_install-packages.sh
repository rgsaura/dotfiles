#!/bin/bash

# Navigate to the home directory
cd "$HOME" || exit

# Determine the system type
system_type=$(uname -s)

if [ "$system_type" == "Darwin" ]; then
  echo "› Mac"
  # Fix that zsh nonsense
  brew install bash
  brew install git
  brew install byobu
  brew install neovim

  brew install python
  pip install --upgrade setuptools
  pip install --upgrade pip
  brew install yarn
  brew install golang
  brew install direnv

  brew cask install docker
  brew cask install iterm2

  # Additional Mac-specific settings
  # defaults write com.apple.dock workspaces-auto-swoosh -bool NO
  # defaults write NSGlobalDomain ApplePressAndHoldEnabled -bool false
  # defaults write com.apple.screencapture location ~/Pictures/Screenshots

  # git config --global core.excludesfile ~/.gitignore
  # sudo chsh -s /usr/local/bin/bash "$USER"
  # cd ~/bin/setup/

  # ./bashmarks.sh
  # ./nvm.sh
  # ./rust.sh
  # ./unison.sh

elif [ "$system_type" == "Linux" ]; then
  echo "› Linux"
  sudo apt-get install -y $(awk '{print $1}' ~/.local/share/chezmoi/pkglist.txt)

else
  echo "Unsupported system type: $system_type"
  exit 1
fi
