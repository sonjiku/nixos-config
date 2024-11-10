#!/usr/bin/env sh

if [ -s "/etc/profile" ]; then
    . "/etc/profile"
fi
## Shell profile
. "${HOME}/.secrets/tokens"

## Load environment at ~/.config/shell/env
. "${HOME}/.config/shell/env"

#if [ "$XDG_SESSION_TYPE"!="x11" ]; then 
#    . "$XDG_CONFIG_HOME/shell/wprofile"
#fi
#
# . "$XDG_CONFIG_HOME/shell/dmdebug"
## Load wayland configs if running wayland
# shellcheck disable=SC1091
if [ "$XDG_SESSION_TYPE" = "wayland" ]; then
    . "$XDG_CONFIG_HOME/shell/wayland"
fi


# shellcheck disable=SC1090
## Load app defaults at ~/.config/shell/defaults/
for file in "$XDG_CONFIG_HOME/shell/defaults/"*; do
    . "$file"
done

# Load aliases at ~/.config/shell/aliases
# shellcheck disable=SC1091
. "$XDG_CONFIG_HOME/shell/aliases"

# shellcheck disable=SC1091
. "$XDG_CONFIG_HOME/shell/wal"


# LOAD SPECIFIC SHELL CONFIGS
shellused="$(ps -o comm= $$)"

if [ "$shellused" != "sh" ]; then
    ## Load Bash only Options at ~/.config/bash/options
    # shellcheck disable=SC1091
    if [ "$shellused" = "bash" ] ; then
        . "$XDG_CONFIG_HOME/bash/profile.sh"
    fi

    # shellcheck disable=SC1091
    # Load zsh only Options at ~/.config/zsh/config
    if [ "$shellused" = "zsh" ] ; then
        export ZDOTDIR="$XDG_CONFIG_HOME/zsh"
        . "$ZDOTDIR/config.zsh"
    fi

    ## TMUX
    # if command -v tmux >/dev/null 2>&1 ; then
    #     # If not running interactively, do not do anything
    #     [ -z "$TMUX" ] && exec tmux
    # fi
fi
