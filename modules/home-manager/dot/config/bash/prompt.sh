#!/usr/bin/env bash

# If not running interactively, don't do anything!
[[ $- != *i* ]] && return


####################
#      COLORS      #
####################
_ESC=$(printf "\e")
# Bold
_BOLD="\[${_ESC}[1m\]"
_BOLR="\[${_ESC}[21m\]"
# Dim
_DIMC="\[${_ESC}[2m\]"
_DIMR="\[${_ESC}[22m\]"
# Italic
_ITLC="\[${_ESC}[3m\]"
_ITLR="\[${_ESC}[23m\]"
# Underline
_UNLN="\[${_ESC}[4m\]"
_UNLR="\[${_ESC}[24m\]"
# Blink
_BLNK="\[${_ESC}[5m\]"
_BLNR="\[${_ESC}[25m\]"
# Reverse
_RVRS="\[${_ESC}[7m\]"
_RVRR="\[${_ESC}[27m\]"
# Hidden
_HDDN="\[${_ESC}[8m\]"
_HDDR="\[${_ESC}[28m\]"
# Overline
_OVLN="\[${_ESC}[53m\]"
# Reset
_CLRS="\[${_ESC}[0m\]"
## Background
_BCDF="\[${_ESC}[49m\]"
_BC00="\[${_ESC}[40m\]"
_BC01="\[${_ESC}[41m\]"
_BC02="\[${_ESC}[42m\]"
_BC03="\[${_ESC}[43m\]"
_BC04="\[${_ESC}[44m\]"
_BC05="\[${_ESC}[45m\]"
_BC06="\[${_ESC}[46m\]"
_BC07="\[${_ESC}[47m\]"
_BC08="\[${_ESC}[49m\]"
_BC09="\[${_ESC}[100m\]"
_BC10="\[${_ESC}[101m\]"
_BC11="\[${_ESC}[102m\]"
_BC12="\[${_ESC}[103m\]"
_BC13="\[${_ESC}[104m\]"
_BC14="\[${_ESC}[105m\]"
_BC15="\[${_ESC}[106m\]"
## FOREGROUND"\[${_ESC}[107m\]"
_FCDF="\[${_ESC}[39m\]"
_FC00="\[${_ESC}[30m\]"
_FC01="\[${_ESC}[31m\]"
_FC02="\[${_ESC}[32m\]"
_FC03="\[${_ESC}[33m\]"
_FC04="\[${_ESC}[34m\]"
_FC05="\[${_ESC}[35m\]"
_FC06="\[${_ESC}[36m\]"
_FC07="\[${_ESC}[37m\]"
_FC08="\[${_ESC}[90m\]"
_FC09="\[${_ESC}[91m\]"
_FC10="\[${_ESC}[92m\]"
_FC11="\[${_ESC}[93m\]"
_FC12="\[${_ESC}[94m\]"
_FC13="\[${_ESC}[95m\]"
_FC14="\[${_ESC}[96m\]"
_FC15="\[${_ESC}[97m\]"


__prompt_cmd() {
    local retval="$?"
    local nixsign="┗"
    local exitsign="━"
    local promptsign="❱"
    local nondirenvdirs=""
    local direnvdirs=""

    ## CWD WITH DIRENV INFO
    _CWDPS="${_ITLC}"
    if [ -n "${DIRENV_DIR}" ]; then
        nondirenvdirs="${DIRENV_DIR/-/}"
        # This removes everything after the last slash
        nondirenvdirs="${nondirenvdirs%/*}"
        direnvdirs="${PWD//$nondirenvdirs/}"
        nondirenvdirs="${nondirenvdirs//$HOME/\~}"
        _CWDPS+="${_FC04}${nondirenvdirs}${_CLRS}"
        _CWDPS+="${_ITLC}"
        _CWDPS+="${_FC05}${direnvdirs}${_CLRS}"
    else
        _CWDPS="${_ITLC}${_FC04}${PWD//$HOME/\~}${_CLRS}"
    fi
    _CWDPS+="${_CLRS}"
    if [ -n "${VIRTUAL_ENV}" ]; then
        _VENVPS="${_FC04}"
    else
        _VENVPS="${_FCDF}"
    fi
    _CWDPS="${_VENVPS}┫${_CLRS}${_CWDPS}"


    ## GIT
    _GITPS=""
    if git branch >/dev/null 2>&1; then
        ### SET BRANCH
        local branch
        branch="$(git rev-parse --abbrev-ref HEAD 2>/dev/null)"
        ### COMPARE TO UPSTREAM
        local compare_upstream
        local remote
        # compare_upstream="$(git status --ahead-behind | grep "Your branch" | sed 's:.*\(is \w\+\).*:\1:' || echo "ERROR")"
        compare_upstream="$(git status -sb 2>/dev/null | grep "##" | grep -o "\[.*\]" || echo "ERROR")"
        if [ -z "$compare_upstream" ]; then
            remote="${_FC10}=${_CLRS}"
        else
            local offset
            local ahead
            local behind
            offset="$(echo "$compare_upstream" | sed 's:ahead :↑:' | sed 's:,\? \?behind :↓:' | sed 's:\[\?\]\?::g')"
            # Extract the 'ahead' part if it exists
            # Extract the 'ahead' part if it exists
            if [[ "$offset" =~ (↑[0-9]+) ]]; then
                ahead="${BASH_REMATCH[1]}"
            fi

            # Extract the 'behind' part if it exists
            if [[ "$offset" =~ (↓[0-9]+) ]]; then
                behind="${BASH_REMATCH[1]}"
            fi
            ahead="${_FC10}${ahead}${_CLRS}"
            behind="${_FC09}${behind}${_CLRS}"
            remote="${ahead}${behind}"
        fi
        ### Workdir Status
        local workdirstatus
        local unstaged
        local staged
        local untracked
        unstaged="$(git diff --name-only 2>/dev/null )"   # Unstaged changes
        staged="$(git diff --cached --name-only 2>/dev/null )"   # Staged changes
        untracked="$(git ls-files --others --exclude-standard 2>/dev/null )"   # Untracked files
        workdirstatus="${unstaged:+"${_FC01}*${_CLRS}"}${staged:+"${_FC04}+${_CLRS}"}${untracked:+"${_FC03}?${_CLRS}"}"
        local dirty
        dirty="$(git status --porcelain 2>/dev/null | grep -c -E '^[A-Z]')"
        dirty="${dirty:+"${_FC09}!${_CLRS}"}"
        local stash_count
        stash_count="$(git stash list 2>/dev/null | wc -l)"
        if [ "${stash_count}" != "0" ]; then
            stash_count="${stash_count:+"${_FC02}S${stash_count}${_CLRS}"}"
        else
            stash_count=""
        fi
        local conflicts
        conflicts="$(git diff --name-only --diff-filter=U 2>/dev/null )"
        conflicts="${conflicts:+"${_FC01}X${_CLRS}"}"
        local remote_branch
        remote_branch="$(git rev-parse --abbrev-ref --symbolic-full-name @\{u\} 2>/dev/null)"
        remote_branch="${_FC11}${remote_branch}${_CLRS}"
        local detached_head
        detached_head="$(git symbolic-ref -q HEAD 2>/dev/null )"
        detached_head="${detached_head:+"DECAPITATED"}"
        # if git status --ahead-behind | grep "Your branch is"
        # PS1+='━@━'
        _GITPS+=" ${_FC15}on${_CLRS} "
        _GITPS+="${_FC15}[${_CLRS}"
        _GITPS+="${_FC02}${branch}${_CLRS}"
        _GITPS+="${workdirstatus}"
        _GITPS+="${dirty}"
        _GITPS+="${stash_count}"
        _GITPS+="${conflicts}"
        _GITPS+="${remote:+" $remote"}"
        _GITPS+="${remote_branch}"
        _GITPS+="${_FC15}]${_CLRS}"
        # _GITPS+="$(__git_ps1 "%s")"
        # # _GITPS+='━┫'
    fi
    _GITPS+="${_VENVPS}┃${_CLRS}"
    ## JOB INFO
    _JOBSPS=""
    local runningj
    local stoppedj
    runningj=$(jobs | grep -c Running)
    stoppedj=$(jobs | grep -c Stopped)
    if [ "$runningj" -ge 1 ]; then
        _JOBSPS+=" ${_FC03}bg${_CLRS}${runningj}"
    fi
    if [ "$stoppedj" -ge 1 ]; then
        _JOBSPS+=" ${_FC01}fg${_CLRS}${stoppedj}"
    fi
    ## PROMPT
    ### Check if in NIX Shell
    if [ -n "${IN_NIX_SHELL}" ]; then
        nixsign="${_FC03}${nixsign}${_CLRS}"
    fi
    ### Check if previour command returned true or false
    if [ "$retval" -eq 0 ]; then
        exitsign="${_FC02}${exitsign}${_CLRS}"
    else
        exitsign="${_FC01}${exitsign}${_CLRS}"
    fi
    ### Check if user is root
    if [ $UID == 0 ]; then
        promptsign="${_FC01}${_BLNK}${promptsign}${_CLRS}"
    else
        promptsign="${_FC14}${_BLNK}${promptsign}${_CLRS}"
    fi
    ### Export var
    _SIGNPS="${nixsign}${exitsign}${promptsign}"

    ## PS0 don't mess with it since it could be set for some reason
    # PS0='\n'

    ## PS1
    PS1="\n"
    PS1+="${_FCDF}┏━${_CLRS}"
    ### PWD
    PS1+="${_CWDPS}"
    # PS1+="${_ITLC}${_FC04}\w${_CLRS}"
    PS1+="${_GITPS}"
    PS1+="${_JOBSPS}"
    PS1+="\n"
    PS1+="${_SIGNPS}"
    PS1+=" "


    ## PS2
    PS2=""
    PS2+="${_DIMC}━━${_CLRS}${_BOLD}${_FC06}+${_CLRS} "
    ## PS3
    PS3=""
    PS3+="${_DIMC}━━${_CLRS}${_FC06}>${_CLRS} "
    ## PS4
    PS4=""
    PS4+="${_DIMC}━━${_CLRS}${_FC06}>${_CLRS} "

    history -a
    history -c
    history -r
}

## PS0 don't mess with it since it could be set for some reason
PROMPT_COMMAND=__prompt_cmd
