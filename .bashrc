#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

alias ls='ls --color=auto'
PS1='[\u@\h \W]\$ '

export PATH=$PATH:/usr/bin/python3
export PATH=$PATH:/var/lib/flatpak/exports/share
export PATH=$PATH:/home/cosmic/.local/share/flatpak/exports/share
export PATH=$PATH:/home/cosmic/.local/bin
# Adding Aliases
alias suspendm='/home/cosmic/suspend.sh'
