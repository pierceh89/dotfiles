#!/bin/sh

# install brew
if [ ! -f $(which brew) ]; then
    /usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
fi

# Make sure we’re using the latest Homebrew.
brew update

# Upgrade any already-installed formulae.
brew upgrade

# Save Homebrew’s installed location.
BREW_PREFIX=$(brew --prefix)

# Install vi-related tools
brew install neovim
brew install ctags-exuberant
brew install gotags

# Install Scala Repl
brew install ammonite-repl

# Install other useful binaries.
brew install ack git tree wget yq jq

# Install ruby
brew install rbenv ruby-build

# Remove outdated versions from the cellar.
brew cleanup
