#!/bin/bash
list_of_monitors=$(hyprctl monitors | grep "Monitors" | cut -d " " -f 2)
echo "$list_of_monitors" | while read -r monitors; do
    echo "$monitors"
done
