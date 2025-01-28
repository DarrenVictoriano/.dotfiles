# Dotfiles Setup Script

This script automates the installation and configuration of my development environment on macOS. It sets up the following:

- Homebrew and essential packages
- macOS system defaults
- Oh My Zsh and its plugins
- Cloning and stowing my dotfiles repository

## Prerequisites

- Xcode Commandline Tool
- ~~iTerm2~~

## Installation

Run this command in your terminal:

```
sh -c "$(curl -fsSL https://raw.githubusercontent.com/DarrenVictoriano/.dotfiles/main/install.sh)"
```

### bat theme

you may need to rebuild the themes for bat

```
bat cache --build
```

