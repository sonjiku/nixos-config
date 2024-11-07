{ config, pkgs, lib, username, ... }: {
    hardware.openrazer.enable = true;
    hardware.openrazer.devicesOffOnScreensaver = false;
    hardware.openrazer.users = [ "${username}" ];
    users.users.sonji.extraGroups = [ "plugdev" ];
    environment.systemPackages = with pkgs; [
        polychromatic
    ];
}
