#!/bin/bash

# pip bash completion start
# _pip_completion()
# {
#     COMPREPLY=( $( COMP_WORDS="${COMP_WORDS[*]}" \
#                    COMP_CWORD=$COMP_CWORD \
#                    PIP_AUTO_COMPLETE=1 $1 2>/dev/null ) )
# }
# complete -o default -F _pip_completion pip
# pip bash completion end

[[ $PS1 && -f /usr/share/bash-completion/bash_completion ]] && \
    source "/usr/share/bash-completion/bash_completion"
# Nix

if [ -e "${HOME}/.local/state/nix/profile/share/bash-completion/completions/nix" ]; then
    source "${HOME}/.local/state/nix/profile/share/bash-completion/completions/nix"
fi
