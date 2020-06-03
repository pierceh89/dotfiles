#!/bin/sh

# install brew
/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"

# Make sure we’re using the latest Homebrew.
brew update

# Upgrade any already-installed formulae.
brew upgrade

# Save Homebrew’s installed location.
BREW_PREFIX=$(brew --prefix)

# Install `wget`
brew install wget 

# Install more recent versions of some macOS tools.
brew install neovim
brew install ctags-exuberant
brew install gotags

# Install Scala Repl
sudo sh -c '(echo "#!/usr/bin/env sh" && curl -L https://github.com/lihaoyi/Ammonite/releases/download/2.0.1/2.13-2.0.1) > /usr/local/bin/amm && chmod +x /usr/local/bin/amm' && amm

# Install other useful binaries.
brew install ack
brew install git
brew install tree

# Install Apple TV Aerial Views Screen Saver
brew cask install aerial

# Remove outdated versions from the cellar.
brew cleanup
