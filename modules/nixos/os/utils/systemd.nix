{ config, pkgs, lib, ... }: {
# List services that you want to enable:
    systemd = {
        tmpfiles= {
            # rules = [];
            # packages = [pkgs.lvm2];
            # settings = {
            #     "10-mypackage" = {
            #         "/var/lib/my-service/statefolder" = {
            #             d = {
            #                 group = "root";
            #                 mode = "0755";
            #                 user = "root";
            #                 type = "";
            #                 argument = "‹name›";
            #                 age = "10d";
            #             }
            #         }
            #     };
            # };
        };
    };
    services = {
        # JournalD
        journald = {
            extraConfig = "SystemMaxUse=50M";
            storage = "persistent";
        };
        ## OpenSSH
        openssh.enable = true;
        ## CUPS
        printing.enable = true;
        ## UDISKS2
        udisks2.enable = true;
        ## Enable flatpak
        flatpak.enable = true;
        gnome.gnome-keyring.enable = true;
        ## dbus
        dbus.enable = true;
    };
}
