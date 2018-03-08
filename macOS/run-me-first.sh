#!/bin/bash -e

# install xcode
xcode-select --install || echo "Note: Is xcode installed already?"

# install homebrew
/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"

# install some homebrew packages, especially ansible for the rest of the setup

brew install ansible
