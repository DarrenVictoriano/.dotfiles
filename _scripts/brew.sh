#!/bin/sh

install_packages() {
  local packages=("$@")
  for package in "${packages[@]}"; do
    if ! brew list "$package" &> /dev/null; then
      echo "Installing $package..."
      brew install "$package"
    else
      echo "$package is already installed."
    fi
  done
}

install_casks() {
  local casks=("$@")
  for cask in "${casks[@]}"; do
    if ! brew list "$cask" &> /dev/null; then
      echo "Installing $cask..."
      brew install --cask "$cask"
    else
      echo "$cask is already installed."
    fi
  done
}

# List of packages to install
packages=(
  stow      # dotfile manager
  thefuck   # will correct commands
  mas       # mac app store
  jq        # json parser
  fzf       # fuzzy finder
  git-delta # better diff
  fd        # better find, used by fzf
  tlrc      # better man
  ripgrep   # better grep
  eza       # better ls
  bat       # better cat
  zoxide    # better cd
  node      # node for nvm
  jesseduffield/lazygit/lazygit  # Lazygit for nvim
  tmux
  nvim
  wget
  hugo
  git
  imagemagick
  # Add more packages here
)

# List of casks to install
casks=(
  iterm2
  visual-studio-code
  alt-tab
  miniconda
  hiddenbar
  font-meslo-for-powerlevel10k
  font-fira-code-nerd-font
  itsycal
  lulu
  obsidian
  raycast
  bitwarden
  nikitabobko/tap/aerospace
  # karabiner-elements  # this requires a sudo installtion
  # Add more casks here
)

# Run the functions with the lists as arguments
install_packages "${packages[@]}"
install_casks "${casks[@]}"

echo "\nbrew.sh completed successfully."
