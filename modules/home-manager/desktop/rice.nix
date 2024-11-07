{
  config,
  lib,
  pkgs,
  ...
}: {
  ## This is done through stylix now
  # home = {
  #     pointerCursor = {
  #         gtk.enable = true;
  #         # package = pkgs.rose-pine-cursor;
  #         # name = "BreezeX-RosePine-Linux";
  #         package = pkgs.catppuccin-cursors.mochaDark;
  #         name = "Catppuccin-Mocha-Dark";
  #         size = 48;
  #     };
  # };

  qt = {
    enable = true;
    style = {
      name = "gtk2";
      # package = pkgs.libsForQt5.qtstyleplugins;
    };
    platformTheme.name = "gtk2";
  };
  gtk = {
    enable = true;
    gtk2.configLocation = "${config.xdg.configHome}/gtk-2.0/gtkrc";
    iconTheme = {
      package = pkgs.catppuccin-papirus-folders;
      name = "Papirus-Dark";
    };
    theme = {
      package = pkgs.magnetic-catppuccin-gtk;
      name = "Catppuccin-GTK-Dark";
    };
  };
  xdg.dataFile."themes" = {
    recursive = true;
    source = config.lib.file.mkOutOfStoreSymlink "${config.gtk.theme.package}/share/themes";
  };
  ## TUI
  home.packages = [
    pkgs.wallust
    pkgs.nwg-look
  ];
  programs = {
    pywal.enable = true;
  };
  ## Flatpak be nice
}
