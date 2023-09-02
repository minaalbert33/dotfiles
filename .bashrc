#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

alias ls='ls --color=auto'
alias ll='ls -la --color=auto'
alias grep='grep --color=auto'
alias cs='clear'

# Pacman Package Manager Aliases
alias i='sudo pacman -S'
alias r='sudo pacman -R'
alias q='sudo pacman -Q'
alias u='sudo pacman -Syu'
alias za='zathura'

export HYPRSHOT_DIR='/home/mina/pictures/screenshots'
PS1='[\u@\h \W]\$ '
