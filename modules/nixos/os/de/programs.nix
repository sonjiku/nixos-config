{ config, pkgs, lib, ... }: {
    programs.kdeconnect.enable = true;
    environment.systemPackages = with pkgs; [
        keepassxc
        ## torrent
        transmission_4
        transmission_4-gtk
    ];
}
