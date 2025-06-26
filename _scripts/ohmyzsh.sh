#!/bin/sh

install_oh_my_zsh() {
    if [ ! -d "$HOME/.oh-my-zsh" ]; then
        echo "Installing oh-my-zsh..."
        # the --unattended flag is to prevent oh-my-zsh installation script to create a new session.
        # if we dont do this, it will stop our installation script
        sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" "" --unattended
        echo "oh-my-zsh is installed."
    else
        echo "oh-my-zsh is already installed."
    fi
}

install_plugin() {
    local git_clone_command="$1"
    # Check if the ~/.oh-my-zsh directory exists
    if [ -d "$HOME/.oh-my-zsh" ]; then
        echo "Installing: $git_clone_command"
        eval "$git_clone_command"
        echo "Plugin/theme installed."
    else
        echo "$HOME/.oh-my-zsh directory does not exist. Cannot install powerlevel10k."
    fi
}

# Execute functions
install_oh_my_zsh

# Install Plugins
install_plugin "git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/themes/powerlevel10k"
install_plugin "git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting"
install_plugin "git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions"
install_plugin "git clone https://github.com/zsh-users/zsh-history-substring-search ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-history-substring-search"

echo "\nohmyzsh.sh completed successfully!"
