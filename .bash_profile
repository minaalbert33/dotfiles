#
# ~/.bash_profile
#

[[ -f ~/.bashrc ]] && . ~/.bashrc
LC_ALL="C"

source ~/dotfiles/scripts/loadhdd.sh
exec Hyprland
