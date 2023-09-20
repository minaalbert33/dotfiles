#!/bin/bash
pkill swaybg

swaybg -i `find ~/wallpaper | shuf -n 1` -m fill 


