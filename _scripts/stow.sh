#!/bin/sh

# Define variables
DOTFILES_DIR="$HOME/.dotfiles"
TPM_DIR="$HOME/.tmux/plugins/tpm"

clone_dotfiles() {
  if [ ! -d "$DOTFILES_DIR" ]; then
    echo "Cloning dotfiles repository..."
    git clone https://github.com/DarrenVictoriano/.dotfiles.git "$DOTFILES_DIR"
    echo "Dotfiles repository cloned into $DOTFILES_DIR."

    # Initialize and update submodules
    echo "Initializing and updating submodules..."
    cd "$DOTFILES_DIR" || exit
    git submodule update --init --recursive
  else
    echo "Dotfiles repository is already cloned."
  fi
}

clone_tpm() {
  if [ ! -d "$TPM_DIR" ]; then
    echo "Cloning Tmux Plugin Manager (TPM) into $TPM_DIR..."
    git clone https://github.com/tmux-plugins/tpm "$TPM_DIR"
    echo "TPM has been cloned into $TPM_DIR."
  else
    echo "TPM is already cloned at $TPM_DIR."
  fi
}

stow_dotfiles() {
  # Ensure that the DOTFILES_DIR variable is set to the path of your dotfiles directory
  if [ -z "$DOTFILES_DIR" ]; then
    echo "DOTFILES_DIR is not set. Please set it to your dotfiles directory path."
    return 1
  fi

  # Ensure that a list of dotfiles is provided as an argument
  if [ "$#" -eq 0 ]; then
    echo "No dotfiles list provided. Please provide a list of directories and corresponding home files."
    return 1
  fi

  # Check if the dotfiles directory exists
  if [ -d "$DOTFILES_DIR" ]; then
    echo "Stowing dotfiles..."
    cd "$DOTFILES_DIR" || return 1

    # Read the list of dotfiles from the argument
    dotfiles_list=("$@")

    # Loop through each entry in the dotfiles_list
    for dotfile in "${dotfiles_list[@]}"; do
      dir="${dotfile%%:*}"        # Extract directory name before the colon
      home_file="$HOME/${dotfile##*:}"  # Extract home file name after the colon

      # Check if the corresponding file or directory exists in the home directory and delete it
      if [ -e "$home_file" ]; then
        if [ -d "$home_file" ]; then
          echo "Deleting existing directory $home_file..."
          rm -rf "$home_file"  # Recursively delete directories
          echo "$home_file directory deleted."
        else
          echo "Deleting existing file $home_file..."
          rm -f "$home_file"  # Delete files
          echo "$home_file file deleted."
        fi
      fi

      # Stow the directory if it exists
      if [ -d "$dir" ] || [ -f "$dir" ]; then
        stow "$dir"
        echo "$dir is stowed."
      else
        echo "$dir does not exist in $DOTFILES_DIR, skipping..."
      fi
    done
  else
    echo "Dotfiles directory $DOTFILES_DIR does not exist. Cannot stow dotfiles."
  fi
}

# Stow Map folder_name:file_name
dotfiles_list=(
  "zsh:.zshrc"
  "p10k:.p10k.zsh"
  "hushlogin:.hushlogin"
  "git:.gitconfig"
  "tmux:.tmux.conf"
  "bat:.config/bat"
  "nvim:.config/nvim"
  "karabiner:.config/karabiner"
)

clone_dotfiles
clone_tpm
stow_dotfiles "${dotfiles_list[@]}"

echo "\nStowing done!"

