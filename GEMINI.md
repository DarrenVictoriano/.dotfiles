# Project: Darren's Dotfiles (Neovim + Tmux + Terminal Stack)

## General Instructions:

- This project is a modular, scriptable, and portable dotfiles setup.
- The focus is on terminal-based development with **Neovim**, **tmux**, and **Ghostty**.
- Keep all configurations declarative and reproducible.
- When adding or modifying configurations:
  - Follow existing naming and folder structure
  - Prefer minimal, well-documented setups
  - Avoid unnecessary dependencies

## Neovim Setup

### Location:
`/Users/darren/.dotfiles/nvim/.config/nvim/`

### General Philosophy:

- Modular and plugin-driven, using `Lazy.nvim`
- Lua-based configuration only
- Fast startup, LSP-native, and tailored for full-stack development
- UI is terminal-themed using Catppuccin

### Structure:

```
nvim/
├── init.lua → Main entry point
├── lazy-lock.json → Plugin lock file
├── .stylelua.toml → Lua style config
├── .luarc.json → Lua workspace config
├── lua/darren/
│ ├── core/ → Base config
│ │ ├── init.lua
│ │ ├── options.lua
│ │ ├── keymaps.lua
│ │ └── autocmds.lua
│ ├── plugins/ → Plugin configs
│ │ ├── init.lua
│ │ ├── lazygit.lua
│ │ ├── telescope.lua
│ │ ├── treesitter.lua
│ │ ├── conform.lua
│ │ ├── lualine.lua
│ │ ├── bufferline.lua
│ │ ├── noice.lua
│ │ ├── alpha.lua
│ │ ├── harpoon.lua
│ │ ├── gitsigns.lua
│ │ ├── oil-nvim.lua
│ │ ├── obsidian-nvim.lua
│ │ ├── which-key.lua
│ │ ├── surround.lua
│ │ ├── todo-comments.lua
│ │ ├── markdown-nvim.lua
│ │ ├── auto-session.lua
│ │ ├── vim-maximizer.lua
│ │ ├── substitute.lua
│ │ ├── indent-blankline.lua
│ │ ├── nvim-tree.lua
│ │ ├── dressing.lua
│ │ ├── autopairs.lua
│ │ ├── outline.lua
│ │ ├── trouble.lua
│ │ ├── catppuccin.lua
│ │ ├── nvim-ufo.lua
│ │ ├── nvim-cmp.lua
│ │ ├── nvim-lint.lua
│ │ └── lsp/
│ │ ├── mason.lua
│ │ └── lspconfig.lua
│ └── lazy.lua → Lazy.nvim bootstrap
```


### Notes:

- Lazy.nvim is bootstrapped from `lua/darren/lazy.lua`
- All plugin specs are defined modularly under `lua/darren/plugins/`
- LSP support is configured via `mason`, `nvim-lspconfig`, and `conform`

### Coding Style (Lua):

- Modules are scoped to `darren/`
- Follow formatting via `.stylelua.toml`
- Prefer local-scoped functions and declarative tables
- Use inline comments for custom mappings or behavior overrides

## Tmux Setup

### Location:
`/Users/darren/.dotfiles/tmux/.tmux.conf`

### Features:

- Prefix key remapped to `Ctrl-Space`
- Uses TPM (`tmux-plugins/tpm`)
- Plugins:
  - `tmux-resurrect`, `tmux-continuum` for session persistence
  - `vim-tmux-navigator` for pane hopping with Neovim
  - `catppuccin/tmux` for themed status line
  - `tmux-sessionist` for quick session switching

### Keybindings:

- `prefix + s`: switch or cycle sessions
- `prefix + w`: custom key table for window navigation
- Pane movement uses `hjkl` keys
- Clipboard integrated with macOS via `pbcopy`

### Status Bar:

- Catppuccin Macchiato theme
- Right section shows current dir, session, and user
- Minimal separators, rounded edges

## Scripted Dotfiles Installation

### Bootstrap Scripts:

Located in `/Users/darren/.dotfiles/_scripts/`

- `install.sh`: entry point for setting up system
- `brew.sh`: installs Homebrew packages
- `appstore.sh`: handles Mac App Store apps
- `stow.sh`: uses GNU Stow to symlink configs
- `ohmyzsh.sh`: installs and configures Oh My Zsh
- `app_settings.sh`: applies macOS system preferences

## Related Tools and Configs

- **Ghostty** Terminal:  
  Config at `ghostty/.config/ghostty/config`  
  Theme matches Neovim and tmux (Catppuccin)

- **Zsh**:  
  `.zshrc`, `.p10k.zsh`, fzf-git integration

- **Bat**:  
  Themed with Catppuccin  
  Config: `bat/.config/bat/config` and `themes/`

- **Karabiner Elements**:  
  Complex keyboard remaps  
  Config: `karabiner/.config/karabiner/karabiner.json`

- **IdeaVim**:  
  Config: `.ideavimrc` for JetBrains consistency

## Regarding Dependencies:

- Avoid adding new plugins without strong reason
- Stick to plugins compatible with Lazy.nvim or TPM
- Keep script dependencies minimal and declarative
- Use `.gitmodules` for any external git-based configs


