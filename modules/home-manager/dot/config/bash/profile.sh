#!/usr/bin/env bash

if command -v direnv > /dev/null;then
    eval "$(direnv hook bash)"
    export DIRENV_LOG_FORMAT=""
fi

if command -v fzf > /dev/null;then
    FZF_ALT_C_COMMAND='' eval "$(fzf --bash)"
    # Print tree structure in the preview window
    # export FZF_ALT_C_OPTS="
    # --walker-skip .git,node_modules,target
    # --preview 'tree -C {}'"

fi

## Add stuff that you want to be run when the terminal loads the shell for the first time.
__login_shell=$()

shopt -q login_shell && echo ; fortune -s | cowsay -r ; echo

# shellcheck disable=SC1091
. "$XDG_CONFIG_HOME/bash/prompt.sh"
. "$XDG_CONFIG_HOME/bash/options.sh"
. "$XDG_CONFIG_HOME/bash/completion.sh"
. "$XDG_CONFIG_HOME/bash/func.sh"


