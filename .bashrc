
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
alias vi='vim'
# alias rm='rm -i'
export vim='nvim'
alias transa='trans :en+ara'
alias gput='nvidia-settings -q gpucoretemp -t'
export HYPRSHOT_DIR='/home/mina/pictures/screenshots'
export RANGER_LOAD_DEFAULT_RC=false
export EDITOR="vim"
export TERMINAL="alacritty"
PS1='\[\e[32m\]\w \[\e[0m\]>\[\e[0m\] '


#eval "$(starship init bash)"

