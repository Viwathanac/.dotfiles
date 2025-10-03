#!/bin/bash

terminal="alacritty"
if [[ -n $(pgrep $terminal) ]]; then
    hyprctl dispatch workspace 3
else
    hyprctl dispatch exec [workspace 3] $terminal
fi
