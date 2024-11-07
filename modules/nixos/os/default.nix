{ config, pkgs, lib, ... }: {

    imports = [ 
        ./de/display-manager/regreet.nix
        ./de/window-manager/sway.nix
        ./de/window-manager/hyprland.nix
        ./utils/default.nix
        ./audio-produciton
    ];
}
