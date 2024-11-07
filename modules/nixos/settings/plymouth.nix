{ config, pkgs, ... }: {
    boot = {
        ## silent boot
        consoleLogLevel = 0;
        initrd.verbose = false;
        kernelParams = [
            "quiet"
            "udev.log_priority=3"
        ];
        loader = {
            # timeout = 1;
            efi.canTouchEfiVariables = true;
            systemd-boot = {
                enable = true;
                consoleMode = "max";
                # configurationLimit = 20;
            };
        };
        plymouth = {
            enable = false;
            themePackages = [ pkgs.adi1090x-plymouth-themes ];
            theme = "lone";
        };
    };
}
