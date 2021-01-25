alias ll='ls --color=auto -ahl'
# Adding things to PATH
export PATH="/usr/bin/python3:$PATH"
export PATH="/home/cosmic/.local/bin:$PATH"
export PATH="/home/cosmic/.gem/ruby/2.7.0/bin:$PATH"

alias suspendm='/home/cosmic/suspend.sh'
alias ll='ls -ahl'
alias vim='nvim'
alias vfzf='fzf | xargs nvim'
alias p='sudo pacman'
alias ssh_jeb='ssh cosmic@192.168.1.69'
alias cp='cp -i'
alias spotify='com.spotify.Client'
alias suspend='systemctl suspend'

export FZF_DEFAULT_COMMAND='fd . --absolute-path --hidden --base-directory ~ --exclude jeb'
set RANGER_LOAD_DEFAULT_RC FALSE

# nnn cd on quit
n ()
{
    # Block nesting of nnn in subshells
    if [ -n $NNNLVL ] && [ "${NNNLVL:-0}" -ge 1 ]; then
        echo "nnn is already running"
        return
    fi

    # The default behaviour is to cd on quit (nnn checks if NNN_TMPFILE is set)
    # To cd on quit only on ^G, remove the "export" as in:
    #     NNN_TMPFILE="${XDG_CONFIG_HOME:-$HOME/.config}/nnn/.lastd"
    # NOTE: NNN_TMPFILE is fixed, should not be modified
    export NNN_TMPFILE="${XDG_CONFIG_HOME:-$HOME/.config}/nnn/.lastd"

    # Unmask ^Q (, ^V etc.) (if required, see `stty -a`) to Quit nnn
    # stty start undef
    # stty stop undef
    # stty lwrap undef
    # stty lnext undef

    nnn "$@"

    if [ -f "$NNN_TMPFILE" ]; then
            . "$NNN_TMPFILE"
            rm -f "$NNN_TMPFILE" > /dev/null
    fi
}

