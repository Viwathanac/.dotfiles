#!/bin/sh
# zsh settings in ~/config/zsh/.zshrc

export XDG_CONFIG_HOME="$HOME/.config"
export XDG_DATA_HOME="$HOME/.local/share"
export XDG_CACHE_HOME="$HOME/.cache"
export XDG_STATE_HOME="$HOME/.local/state"
export XDG_RUNTIME_DIR="/run/user/$UID"

export EDITOR="nvim"
export TERM="alacritty"
export TERMINAL="alacritty"
export BROWSER="firefox"
export MANPAGER="nvim +Man!"

export PATH="$HOME/.local/share/nvim/mason/bin/:$PATH"
export PATH="$HOME/.local/bin/scripts/:$PATH"
