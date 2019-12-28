#!/bin/sh

# install brew
/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"

# Make sure we’re using the latest Homebrew.
brew update

# Upgrade any already-installed formulae.
brew upgrade

# Save Homebrew’s installed location.
BREW_PREFIX=$(brew --prefix)

# Install `wget` with IRI support.
brew install wget --with-iri

# Install more recent versions of some macOS tools.
brew install neovim

# Install other useful binaries.
brew install ack
brew install git
brew install tree

# Install Apple TV Aerial Views Screen Saver
brew cask install aerial

# Remove outdated versions from the cellar.
brew cleanup
