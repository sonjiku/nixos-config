{ config, pkgs, lib, ... }: {
# display manager
    services.greetd = {
        enable = true;
    #     package = pkgs.greetd.greetd;
        # settings = {
        #     default_session = {
        #         command = "${pkgs.hyprland}/bin/Hyprland -c ${pkgs.nwg-hello}/etc/nwg-hello/hyprland.conf";
    #             command = "${pkgs.greetd.tuigreet}/bin/tuigreet -t -r --remember-user-session --user-menu --asterisks -g Hola!";
        #     };
        # };
    };
    programs.regreet = {
        enable = true;
        # settings = { 
        #     background = {
        #         path = "/etc/greetd/bg";
        #         fit = "Fill";
        #     };
        #     GTK = {
        #         application_prefer_dark_theme = lib.mkForce true;
        #     };
        # };
        # font = {
        #     size = 16;
        #     name = "JetBrains Mono Nerd Font Mono";
        #     package =  (pkgs.nerdfonts.override { fonts = [ "JetBrainsMono" ]; });
        # };
        # iconTheme = {
        #     package = pkgs.kanagawa-icon-theme;
        #     name = "Kanagawa";
        # };
        # cursorTheme = {
        #     package = pkgs.graphite-cursors;
        #     name = "graphite-dark";
        # };
        # theme = {
        #     package = pkgs.kanagawa-gtk-theme;
        #     name = "Kanagawa-B";
        # };
    };
}
