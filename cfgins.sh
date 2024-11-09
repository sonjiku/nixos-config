#!/usr/bin/env sh

PROPER_CONFIG_PATH="$HOME/.config/nixos/current"
PROPER_CONFIG_DIR="$(dirname "$PROPER_CONFIG_PATH")"
CURRENT_SCRIPT_PATH="$(dirname "$0")"

if echo "$1" | grep -qEe "^(-r|--rebuild)$"; then
    REBUILD="1"
else
    REBUILD=""
fi

if [ "$PROPER_CONFIG_PATH" != "$CURRENT_SCRIPT_PATH" ]; then
    echo "Attempting to install to proper config directory '$PROPER_CONFIG_PATH'"
    # check if path exists:
    # Yes: Exit with error
    # No: Copy this script's dir to CORRECT_PATH
    if [ ! -d "$PROPER_CONFIG_DIR" ]; then
        rsync -a --mkpath "$CURRENT_SCRIPT_PATH" "$PROPER_CONFIG_PATH" || exit 1
        echo "Config installed successfully."
        CONFIG_FLAKE="$PROPER_CONFIG_PATH"
    else
        echo "Config dir is already populated." >&2
        echo "If you want to install you should backup '$PROPER_CONFIG_DIR' and try again." >&2
        if [ "$REBUILD" = "1" ]; then
            CONFIG_FLAKE="$CURRENT_SCRIPT_PATH"
        else
            exit 1
        fi
    fi
fi

echo "Config in proper directory"

if [ "$REBUILD" = "1" ]; then
    echo "Proceed to rebuild..."
    sudo nixos-rebuild switch --flake "$CONFIG_FLAKE" --show-trace --print-build-logs --verbose || exit 1
fi
exit 0
