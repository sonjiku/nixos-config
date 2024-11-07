{ config, pkgs, ... }: {
    imports = [ 
        ./nix-settings.nix
        ./system.nix
        ./users.nix
        ./theme.nix
    ];
}
