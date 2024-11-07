#!/usr/bin/env bash

dirvenv() {
    if [ -z "$DIRENV_FILE" ]; then
        echo Not managed by direnv
        return;
    else
        local direnvdir="${DIRENV_FILE%/*}"
        if [ -d "$direnvdir/.venv" ]; then
            source "$direnvdir/.venv/bin/activate"
        fi
    fi
}

mkfile() {
    mkdir -p "$(dirname "$1")" && touch "$1" ;
}

if command -v fzf > /dev/null; then
    fzhist() {
        local tmuxarg=""
        local args
        if [[ "$TERM" = "tmux"* ]]; then
            tmuxarg="--tmux"
        fi
        args="--scheme=history --cycle --border=block --info-command='echo -e \"\x1b[33;1m$FZF_POS\x1b[m/$FZF_INFO 💛\"' ${tmuxarg}"

    }
    
fi
