{ config, pkgs, ... }: {
    # Home Manager needs a bit of information about you and the paths it should
    # manage.
    imports = [ 
        ./rice.nix
        ./games.nix
        ./guiapps.nix
        ./xdg.nix
    ];
}
