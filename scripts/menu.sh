#!/bin/bash


choice=$(echo -e "lf\nthunar\n" | rofi -dmenu  )
if [[ "$choice" = "lf" ]]; then
    alacritty -e lf 
elif [[ "$choice" = "thunar" ]]; then
    thunar
fi

