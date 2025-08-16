# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:$HOME/.local/bin:/usr/local/bin:$PATH

# Path to your Oh My Zsh installation.
export ZSH="$HOME/.oh-my-zsh"

# Set name of the theme to load --- if set to "random", it will
# load a random theme each time Oh My Zsh is loaded, in which case,
# to know which specific one was loaded, run: echo $RANDOM_THEME
# See https://github.com/ohmyzsh/ohmyzsh/wiki/Themes
ZSH_THEME="powerlevel10k/powerlevel10k"

# Set list of themes to pick from when loading at random
# Setting this variable when ZSH_THEME=random will cause zsh to load
# a theme from this variable instead of looking in $ZSH/themes/
# If set to an empty array, this variable will have no effect.
# ZSH_THEME_RANDOM_CANDIDATES=( "robbyrussell" "agnoster" )

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion.
# Case-sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# Uncomment one of the following lines to change the auto-update behavior
# zstyle ':omz:update' mode disabled  # disable automatic updates
# zstyle ':omz:update' mode auto      # update automatically without asking
# zstyle ':omz:update' mode reminder  # just remind me to update when it's time

# Uncomment the following line to change how often to auto-update (in days).
# zstyle ':omz:update' frequency 13

# Uncomment the following line if pasting URLs and other text is messed up.
# DISABLE_MAGIC_FUNCTIONS="true"

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
# You can also set it to another string to have that shown instead of the default red dots.
# e.g. COMPLETION_WAITING_DOTS="%F{yellow}waiting...%f"
# Caution: this setting can cause issues with multiline prompts in zsh < 5.7.1 (see #5765)
# COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# You can set one of the optional three formats:
# "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# or set a custom format using the strftime function format specifications,
# see 'man strftime' for details.
# HIST_STAMPS="mm/dd/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load?
# Standard plugins can be found in $ZSH/plugins/
# Custom plugins may be added to $ZSH_CUSTOM/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(
  git
  sudo
  extract
  kubectl
  gcloud
  zsh-autosuggestions
  zsh-syntax-highlighting
  zsh-history-substring-search
  zsh-kubectl-prompt
  poetry
)

source $ZSH/oh-my-zsh.sh
ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE='fg=23'

## Parse kubectl promt to only display the context
function kubectl_prompt() {
    context=$(echo "$ZSH_KUBECTL_CONTEXT" | cut -d'_' -f2)
    
    # Check if the first index is not empty
    if [ -n "$context" ]; then
		echo "$context"
    else
        # Return an error message if the first index is empty
        echo "Error: Unable to extract the 1st index from ZSH_KUBECTL_CONTEXT"
    fi
}
RPROMPT='%{$fg[blue]%}($(kubectl_prompt))%{$reset_color%}'

# CLI Tools
# enable thefuck
eval $(thefuck --alias)
# Set up fzf key bindings and fuzzy completion
source <(fzf --zsh)
# fzf-git
source $HOME/.config/zsh/fzf-git.sh
# zoxide for better cd
eval "$(zoxide init zsh)"

# Bind Keys
bindkey "$terminfo[kcuu1]" history-substring-search-up
bindkey "$terminfo[kcud1]" history-substring-search-down

# Exports
# FZF: let fzf use fs instead of find
export FZF_DEFAULT_COMMAND="fd --hidden --strip-cwd-prefix --exclude .git"
export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"
export FZF_ALT_C_COMMAND="fd --type=d --hidden --strip-cwd-prefix --exclude .git"
# FZF: let fzf have preview and use eza for dir and bat for files
show_file_or_dir_preview="if [ -d {} ]; then eza --tree --color=always {} | head -200; else bat -n --color=always --line-range :500 {}; fi"
# export FZF_CTRL_T_OPTS="--preview '$show_file_or_dir_preview'"
export FZF_CTRL_T_OPTS="--preview '$HOME/.config/zsh/zsh_fzf_preview.sh {}'"
export FZF_ALT_C_OPTS="--preview 'eza --tree --color=always {} | head -200'"

# bat theme
export BAT_THEME="Catppuccin Macchiato"


#### Alias ####
# For a full list of active aliases, run `alias`.
alias refresh='source ~/.zshrc'
alias ls='eza -lh --group-directories-first --icons=auto'
alias la='ls -a'
alias cat='bat'
alias lt='eza --tree --level=3 --git --group-directories-first'
alias lta='lt -a'
alias ff="fzf --preview '$HOME/.config/zsh/zsh_fzf_preview.sh {}'"
alias fd='fd -H --exclude .git'
alias icat='kitty icat'
alias cd='z'
alias k="kubectl"
alias del="trash"
alias diff='git diff --no-index'
alias f='fuck'
alias fman='compgen -c | fzf | xargs man'
alias ftldr='compgen -c | fzf | xargs tldr'
alias vim='nvim'
alias grep='rg'
alias kswitchcontext='kubectl config use-context $(kubectl config get-contexts -o name | fzf)'
alias tmux-keys='tmux list-keys | fzf'


#### Functions ####
function pandoc-md-to-pdf() {
    # https://github.com/Wandmalfarbe/pandoc-latex-template?tab=readme-ov-file
    pandoc "$1" -o "$2" --verbose --template=eisvogel --from markdown --listings -V listings-no-page-break -V listings-disable-line-numbers
}

function history-fzf() {
  local selected
  selected=$(history | awk '{ $1=""; print substr($0,2) }' | fzf --height 40% --reverse --border --ansi) || return
  if [[ -n $selected ]]; then
    # Use `readline` to insert the text into the prompt in bash
    # For zsh, you might need a different approach
    printf '%s' "$selected" | pbcopy   # copy to clipboard
    echo "Copied to clipboard: $selected"
  fi
}


function trash() {
    # Try to move the item to Trash
    mv -f "$1" ~/.Trash
    if [ $? -eq 0 ]; then
        echo "Moved to Trash: '$1'"
    else
        # If moving to Trash fails, delete the item
        rm -rf "$1"
        if [ $? -eq 0 ]; then
            echo "Deleted: '$1'"
        else
            echo "Failed to delete: '$1'"
        fi
    fi
}

function git-keys() {
	# show git aliases
    # Assuming Oh My Zsh is installed in the default location
    git_plugin_file="$HOME/.oh-my-zsh/plugins/git/git.plugin.zsh"
    
    # Check if the plugin file exists
    if [[ -f "$git_plugin_file" ]]; then
        # Use grep to extract lines starting with "alias"
        grep "^alias" "$git_plugin_file" | fzf
    else
        echo "Git plugin file not found."
    fi
}

function zsh-alias() {
    # Assuming Oh My Zsh is installed in the default location
    git_plugin_file="$HOME/.zsh_aliases"
    
    # Check if the plugin file exists
    if [[ -f "$git_plugin_file" ]]; then
        # Use grep to extract lines starting with "alias"
        grep "^alias" "$git_plugin_file" | fzf
    else
        echo "Git plugin file not found."
    fi
}

function zsh-funcs() {
    # Assuming Oh My Zsh is installed in the default location
    git_plugin_file="$HOME/.zsh_functions"
    
    # Check if the plugin file exists
    if [[ -f "$git_plugin_file" ]]; then
        # Use grep to extract lines starting with "alias"
        grep "^function" "$git_plugin_file"
    else
        echo "Git plugin file not found."
    fi
}
### End of Functions ####

# Add custom Alias and Functions if exist
[ -f $HOME/.config/zsh/zsh_aliases ] && source $HOME/.config/zsh/zsh_aliases
[ -f $HOME/.config/zsh/zsh_functions ] && source $HOME/.config/zsh/zsh_functions

# FZF Theme
[ -f $HOME/.config/zsh/fzf_tokyonight_storm ] && source $HOME/.config/zsh/fzf_tokyonight_storm


#### FZF customs ####
# Use fd (https://github.com/sharkdp/fd) for listing path candidates.
# - The first argument to the function ($1) is the base path to start traversal
# - See the source code (completion.{bash,zsh}) for the details.
_fzf_compgen_path() {
  fd --hidden --exclude .git . "$1"
}

#  for ** completion of fzf for looking dir
_fzf_compgen_dir() {
  fd --type=d --hidden --exclude .git . "$1"
}

# Advanced customization of fzf options via _fzf_comprun function
# - The first argument to the function is the name of the command.
# - You should make sure to pass the rest of the arguments to fzf.
_fzf_comprun() {
  local command=$1
  shift

  case "$command" in
    cd)           fzf --preview 'eza --tree --color=always {} | head -200' "$@" ;;
    export|unset) fzf --preview "eval 'echo \${}'"         "$@" ;;
    ssh)          fzf --preview 'dig {}'                   "$@" ;;
    *)            fzf --preview "$show_file_or_dir_preview" "$@" ;;
  esac
}
#### End of FZF ####


# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
# if [[ -n $SSH_CONNECTION ]]; then
#   export EDITOR='vim'
# else
#   export EDITOR='nvim'
# fi

# Compilation flags
# export ARCHFLAGS="-arch $(uname -m)"

# Set personal aliases, overriding those provided by Oh My Zsh libs,
# plugins, and themes. Aliases can be placed here, though Oh My Zsh
# users are encouraged to define aliases within a top-level file in
# the $ZSH_CUSTOM folder, with .zsh extension. Examples:
# - $ZSH_CUSTOM/aliases.zsh
# - $ZSH_CUSTOM/macos.zsh

# pyenv setup
export PYENV_ROOT="$HOME/.pyenv"
export PATH="$PYENV_ROOT/bin:$PATH"
eval "$(pyenv init --path)"
eval "$(pyenv init -)"

export VCPKG_ROOT="$HOME/code/cpp/vcpkg/vcpkg"
export PATH="$VCPKG_ROOT:$PATH"

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh


