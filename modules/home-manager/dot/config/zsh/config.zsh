#! /usr/bin/env zsh

autoload -Uz compinit
compinit

zstyle ':completion:*' menu select

autoload -Uz up-line-or-beginning-search down-line-or-beginning-search
zle -N up-line-or-beginning-search
zle -N down-line-or-beginning-search

HISTFILE=~/.cache/zsh_history
HISTSIZE=10000
SAVEHIST=10000

setopt autocd beep extendedglob nomatch notify

# bindkey -v

source "$ZDOTDIR/keys.zsh"
source "$ZDOTDIR/prompt.zsh"
