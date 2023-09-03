#
# ~/.bash_profile
#

[[ -f ~/.bashrc ]] && . ~/.bashrc
LC_ALL="C"

# make QT apps to use wayland instead of X11
export QT_QPA_PLATFORMTHEME="qt5ct"
export QT_QPA_PLATFORM=wayland

source ~/dotfiles/scripts/loadhdd.sh
exec Hyprland
