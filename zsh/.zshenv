alias ll='ls --color=auto -ahl'
# Adding things to PATH
export PATH="/usr/bin/python3:$PATH"
export PATH="/home/cosmic/.local/bin:$PATH"

alias suspendm='/home/cosmic/suspend.sh'
alias ll='ls -ahl'
alias vim='nvim'
alias vfzf='fzf | xargs nvim'
alias p='sudo pacman'

export FZF_DEFAULT_COMMAND="find -L"
set RANGER_LOAD_DEFAULT_RC FALSE

mount /server_root 2> /dev/null
xset r rate 175 20
