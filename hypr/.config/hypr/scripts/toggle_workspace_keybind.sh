#!/bin/env bash

file_path="../modules/var.conf"
temp_file="./assets/temp.txt"
current_keybind=$(cat $file_path | grep "keybind" | cut -d " " -f 3)

head -n -11 $file_path >./assets/temp.txt
if [ "$current_keybind" = "qwerty" ]; then
    cat ./assets/workspace_real_prog_dvorak.txt >>$temp_file
elif [ "$current_keybind" = "dvorak" ]; then
    cat ./assets/workspace_qwerty.txt >>$temp_file
fi

cat $temp_file >$file_path
echo "" >$temp_file
hyprctl reload
