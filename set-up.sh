#!/bin/bash

cd "$HOME" || return
system_type=$(uname -s)
if [[ $system_type == "Darwin" ]]; then
echo "Hello Mac User!"
echo "Installing Basics….."
# install homebrew
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install.sh)"
# install the git from homebrew
brew install git
fi
if [[ $system_type == "Linux" ]]; then
echo "Hello Linux User!"
echo "Installing Basics….."
sudo apt update
# make sure git is installed, not all installations have it by default
sudo apt install -y git
fi

# install chezmoi
sudo sh -c "$(curl -fsLS get.chezmoi.io)" -- -b /bin

export PATH=$HOME/bin:$PATH
chezmoi init --apply --verbose git@github.com:rgsaura/dotfiles.git