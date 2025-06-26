#!/bin/bash

set -e  # Exit on any error


install_brew_packages() {
  echo "Installing homebrew and packages from _scripts/brew.sh"
  sh -c "$(curl -fsSL https://raw.githubusercontent.com/DarrenVictoriano/.dotfiles/main/_scripts/brew.sh)"
}

install_from_appstore() {
  echo "Install from Apple AppStore using _scripts/appstore.sh"
  sh -c "$(curl -fsSL https://raw.githubusercontent.com/DarrenVictoriano/.dotfiles/main/_scripts/appstore.sh)"
}

install_ohmyzsh() {
  echo "Installing oh-my-zsh and plugins from _scripts/ohmyzsh.sh"
  sh -c "$(curl -fsSL https://raw.githubusercontent.com/DarrenVictoriano/.dotfiles/main/_scripts/ohmyzsh.sh)"
}

clone_dotfiles_and_stow() {
  echo "Start Stowing process using _scripts/stow.sh"
  sh -c "$(curl -fsSL https://raw.githubusercontent.com/DarrenVictoriano/.dotfiles/main/_scripts/stow.sh)"
}

update_app_settings() {
  echo "changing MacOS defaults using _scripts/app_settings.sh"
  sh -c "$(curl -fsSL https://raw.githubusercontent.com/DarrenVictoriano/.dotfiles/main/_scripts/app_settings.sh)"
}

# Main function to run all installations and configurations
install_brew_packages
install_from_appstore
install_ohmyzsh
clone_dotfiles_and_stow
update_app_settings

# Execute main function
echo "\nSetup completed. Quit this terminal session (cmd + q) then launch iTerm2 to see the updates."
