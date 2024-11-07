{ config, pkgs, lib, ... }: {
    programs.bash = {
        completion.enable = true;
    };
# tmux
    # programs.tmux.enable = true;

# android
    programs.adb.enable = true;
}
