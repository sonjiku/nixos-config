#!/usr/bin/env bash

# Vi Mode
set -o vi
# Autocding by only tiping the dir name
stty -ixon
shopt -s autocd
shopt -s cdable_vars
shopt -s cdspell
shopt -s checkjobs
shopt -s dirspell
shopt -u direxpand
shopt -s globstar
shopt -s gnu_errfmt
complete -cf doas
# History
shopt -s histappend
export HISTFILE="$XDG_CACHE_HOME/bash_history"
export HISTCONTROL=ignoredups
export HISTSIZE=5000
export HISTFILESIZE=10000
export HISTTIMEFORMAT="%F %T "
