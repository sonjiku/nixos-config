{ config, pkgs, ... }: {
    ## Use the systemd-boot EFI boot loader.
    boot = {
        tmp = {
            cleanOnBoot = true;
            useTmpfs = false;
            tmpfsSize = "100%";
        };
        hardwareScan = true;
        ## systemd
        initrd.systemd.enable = true;
        loader = {
            # timeout = 1;
            efi.canTouchEfiVariables = true;
            systemd-boot = {
                enable = true;
                consoleMode = "max";
                # configurationLimit = 20;
            };
        };
    };

    ## security
    security = {
        polkit.enable = true;
        ## realtime priority
        rtkit.enable = true;
        doas.enable = true;
    };

    ## Network Settings
    networking.hostName = "kunix";
    ## Set your time zone.
    time.timeZone = "Europe/Athens";
    ## Select internationalisation properties.
    i18n.defaultLocale = "en_US.UTF-8";

    ## Some programs need SUID wrappers, can be configured further or are
    ## started in user sessions.
    programs.mtr.enable = true;
    programs.gnupg.agent = {
        enable = true;
        enableSSHSupport = true;
    };
}
