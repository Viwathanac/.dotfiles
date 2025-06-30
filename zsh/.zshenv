#!/bin/sh
# zsh settings in ~/config/zsh/.zshrc

export EDITOR="nvim"
export TERM="alacritty"
export TERMINAL="alacritty"
export BROWSER="firefox"
export BROWSER2="librewolf"

# Follow XDG Base Directory Specification
export XDG_CONFIG_HOME="$HOME/.config"
export XDG_DATA_HOME="$HOME/.local/share"
export XDG_CACHE_HOME="$HOME/.cache"

# bootstrap .zshrc to ~/.config/zsh/.zshrc, any other zsh config files can also reside here
export ZDOTDIR="$XDG_CONFIG_HOME/zsh"
