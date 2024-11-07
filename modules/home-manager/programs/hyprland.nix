{
  config,
  pkgs,
  lib,
  inputs,
  ...
}: {
  wayland.windowManager.hyprland = {
    enable = true;
    package = inputs.hyprland.packages.${pkgs.stdenv.hostPlatform.system}.hyprland;
    # extraConfig = ''
    #   ## input config
    #   input:touchpad {
    #       disable_while_typing = true
    #       natural_scroll = true
    #       scroll_factor = 1.0
    #       middle_button_emulation = false
    #       tap_button_map = lmr
    #       clickfinger_behavior = false
    #       tap-to-click = true
    #       drag_lock = false
    #       tap-and-drag = false
    #   }
    #   ## monitor config
    #   monitor=,preferred,auto,1, bitdepth, 10
    #
    #   $mainMod = SUPER
    #   $TERMINAL = wezterm
    #   ## Example binds, see https://wiki.hyprland.org/Configuring/Binds/ for more
    #   bind = $mainMod, RETURN, exec, $TERMINAL
    #   bind = $mainMod, Q, killactive, 
    #   bind = $mainMod, M, exit, 
    #   bind = $mainMod, V, togglefloating, 
    #   bind = $mainMod, F, fullscreen, 
    #   bind = $mainMod, P, exec, tofi-drun
    #   bind = $mainMod, D, pseudo, # dwindle
    #   bind = $mainMod, S, togglesplit, # dwindle
    #   ## Move focus with mainMod + arrow keys
    #   bind = $mainMod, h, movefocus, l
    #   bind = $mainMod, l, movefocus, r
    #   bind = $mainMod, k, movefocus, u
    #   bind = $mainMod, j, movefocus, d
    #   ## Switch workspaces with mainMod + [0-9]
    #   bind = $mainMod, 1, workspace, 1
    #   bind = $mainMod, 2, workspace, 2
    #   bind = $mainMod, 3, workspace, 3
    #   bind = $mainMod, 4, workspace, 4
    #   bind = $mainMod, 5, workspace, 5
    #   bind = $mainMod, 6, workspace, 6
    #   bind = $mainMod, 7, workspace, 7
    #   bind = $mainMod, 8, workspace, 8
    #   bind = $mainMod, 9, workspace, 9
    #   bind = $mainMod, 0, workspace, 10
    #   ## Move active window to a workspace with mainMod + SHIFT + [0-9]
    #   bind = $mainMod SHIFT, 1, movetoworkspace, 1
    #   bind = $mainMod SHIFT, 2, movetoworkspace, 2
    #   bind = $mainMod SHIFT, 3, movetoworkspace, 3
    #   bind = $mainMod SHIFT, 4, movetoworkspace, 4
    #   bind = $mainMod SHIFT, 5, movetoworkspace, 5
    #   bind = $mainMod SHIFT, 6, movetoworkspace, 6
    #   bind = $mainMod SHIFT, 7, movetoworkspace, 7
    #   bind = $mainMod SHIFT, 8, movetoworkspace, 8
    #   bind = $mainMod SHIFT, 9, movetoworkspace, 9
    #   bind = $mainMod SHIFT, 0, movetoworkspace, 10
    #   ## Scroll through existing workspaces with mainMod + scroll
    #   bind = $mainMod, mouse_down, workspace, e+1
    #   bind = $mainMod, mouse_up, workspace, e-1
    #   ## Move/resize windows with mainMod + LMB/RMB and dragging
    #   bindm = $mainMod, mouse:272, movewindow
    #   bindm = $mainMod, mouse:273, resizewindow
    # '';
    # finalPackage = ;
    # importantPrefixes = ;
    # plugins = ;
    # settings = ;
    # sourceFirst = true;
    # systemd.enable = true;
    # systemd.enableXdgAutostart = true;
    # systemd.extraCommands = ;
    # systemd.variables = ;
    xwayland.enable = true;
  };
  # programs.hyprlock = {
  #   enable = true;
  #   settings = ;
  # };
  # services.hypridle.enable = ;
  # services.hypridle.settings = ;
  # services.hyprpaper.settings = ;
}
