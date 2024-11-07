{ config, pkgs, lib, ... }: {

    imports = [ 
        ./systemd.nix
        ./packages.nix
        ./programs.nix
    ];
}
