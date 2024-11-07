{
  lib,
  config,
  pkgs,
  ...
}: let
  cfg = config.home-modules.stylix;
in {
  options.home-modules.stylix = {
    enable = lib.mkEnableOption "enable stylix";
  };

  config = lib.mkIf cfg.enable {
    stylix = {
      enable = true;
      autoEnable = false;
      image = pkgs.fetchurl {
        url = "https://avatars.githubusercontent.com/u/57968409?v=4&size=128";
        sha256 = "sha256-gTdF3036E8L1a4dmgce0D7wttE+8DVy4YA/xHfQsj6g=";
      };
      imageScalingMode = "fit";
      polarity = "dark";
      base16Scheme = "${pkgs.base16-schemes}/share/themes/catppuccin-mocha.yaml";
      fonts = {
        serif = {
          name = "iA Writer Quattro V";
          package = pkgs.ia-writer-quattro;
        };

        sansSerif = {
          name = "iA Writer Quattro V";
          package = pkgs.ia-writer-quattro;
        };

        monospace = {
          name = "JetBrains Mono Nerd Font Mono";
          package = pkgs.nerdfonts.override {fonts = ["JetBrainsMono"];};
        };

        emoji = {
          name = "Noto Color Emoji";
          package = pkgs.noto-fonts-emoji;
        };
        sizes = {
          applications = 12;
          desktop = 10;
          popups = 10;
          terminal = 12;
        };
      };
      cursor = {
        package = pkgs.catppuccin-cursors.mochaDark;
        name = "catppuccin-mocha-dark-cursors";
        size = 42;
      };
      opacity = {
        applications = 0.9;
        desktop = 0.9;
        popups = 0.8;
        terminal = 0.9;
      };
      targets = {
        console.enable = true;
        # chromium.enable = true;
        gnome.enable = true;
        # fish.enable = true;
        gtk.enable = true;
        nixos-icons.enable = true;
        # plymouth.enable = true;
        # plymouth.logoAnimated = true;
        regreet.enable = false;
      };
    };

    # home-manager.sharedModules = [
    #   {
    #     stylix = {
    #       targets = {
    #         kde.enable = true;
    #         gtk.enable = true;
    #       };
    #     };
    #   }
    # ];
  };
}
