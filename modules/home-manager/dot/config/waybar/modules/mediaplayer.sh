#! /usr/bin/env sh

if playerctl -l | grep -q "spotify"; then
    class="spotify"
    cmd="playerctl -p spotify"
    text=""
else
    class="default"
    cmd="playerctl"
    text="󰝚"
fi

player_status=" $($cmd status 2> /dev/null)"
text="$text$player_status"

artist="$($cmd metadata artist)"
title="$($cmd metadata title)"
album="$($cmd metadata album)"
tooltip="$artist - $title($album)"

printf '{"text": "%s", "class": "%s", "tooltip": "%s"}' "$text" "$class" "$tooltip"
