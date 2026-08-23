#!/bin/env bash

mkdir -p $HOME/.local/bin
mkdir -p $HOME/wallpapers

stow -Rv -t $HOME/.local/bin bin
stow -Rv -t $HOME/wallpapers/ wallpapers 
stow -Rv -t $HOME zsh 
stow -Rv -t $XDG_CONFIG_HOME config
