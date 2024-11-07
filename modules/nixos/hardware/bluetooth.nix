{ config, pkgs, lib, ... }:
{
    hardware.bluetooth = {
        enable = true;
        package = pkgs.bluez;
        powerOnBoot = true;
        settings = {
            General = {
                Name = "sonjikunix";
                ControllerMode = "dual";
                FastConnectable = "true";
                Experimental = "true";
            };
            Policy = {
                AutoEnable = "true";
            };
        };
    };
    services.blueman.enable = true;
}
