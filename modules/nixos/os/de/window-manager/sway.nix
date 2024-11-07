{
  config,
  inputs,
  pkgs,
  lib,
  ...
}: {
  imports = [
    ../programs.nix
  ];

  programs.sway = {
    enable = true;
    package = pkgs.swayfx;
    xwayland.enable = true;
    wrapperFeatures.gtk = true;
    wrapperFeatures.base = true;
    extraPackages = with pkgs; [
      wayland
      xorg.xauth
      # sway specific
      swaylock-fancy
      swayidle
      swayimg
      # gsettings
      glib
      # gtk
      gtk-layer-shell
      junction
      # menu
      tofi
      # bar
      waybar
      # panel
      networkmanagerapplet
      udiskie
      batsignal
      # colorpicker
      # hyprpicker
      # screenshots
      grim
      slurp
      sway-contrib.grimshot
      # notifications
      libnotify
      mako
      swww
      # terminal
      foot
      inputs.wezterm.packages.${pkgs.system}.default
      inputs.zen-browser.packages."${pkgs.system}".specific
      # wayland tools
      wf-recorder
      ## configure displays
      kanshi
      wdisplays
      wlr-randr
      wlsunset
      ## clipboard
      wl-clipboard
      cliphist
      ## input watcher
      libinput
      wev
      wlprop
    ];
    extraSessionCommands = ''
      . "$XDG_CONFIG_HOME/shell/wayland"
    '';
  };

  programs.dconf.enable = lib.mkForce true;
  xdg = {
    autostart.enable = true;
    menus.enable = true;
    mime.enable = true;
    icons.enable = true;
    sounds.enable = true;
    portal = {
      enable = true;
      config = {
        common.default = ["gnome"];
      };
      lxqt.enable = true;
      wlr = {
        enable = true;
        # settings = {
        #     screencast = {
        #         output_name = "HDMI-A-1";
        #         max_fps = 30;
        #         exec_before = "disable_notifications.sh";
        #         exec_after = "enable_notifications.sh";
        #         chooser_type = "simple";
        #         chooser_cmd = "${pkgs.slurp}/bin/slurp -f %o -or";
        #     };
        # };
      };
      xdgOpenUsePortal = true;
      extraPortals = [
        pkgs.xdg-desktop-portal-gtk
        pkgs.xdg-desktop-portal-shana
        # pkgs.xdg-desktop-portal-hyprland
      ];
    };
  };

  security = {
    pam.services.swaylock.text = ''
      # PAM configuration file for the swaylock screen locker. By default, it includes
      # the 'login' configuration file (see /etc/pam.d/login)
      auth include login
    '';
  };
}
