{
  config,
  pkgs,
  myConfig,
  ...
}: {
}
# home.file = {
#   NOthemes = {
#     # enable = (if vars.workstation then true else false);
#     recursive = true;
#     source = config.lib.file.mkOutOfStoreSymlink (pkgs.symlinkJoin {
#       name = "userallthemes";
#       paths = ["/run/current-system/sw/share/themes" "${config.xdg.stateHome}/home-manager/gcroots/home-path/share/themes"];
#     });
#     target = "${config.xdg.dataHome}/share/themes";
#   };
#   # NOicons = {
#   #   # enable = (if vars.workstation then true else false);
#   #   recursive = true;
#   #   source = config.lib.file.mkOutOfStoreSymlink "/run/current-system/sw/share/icons";
#   #   target = "${config.xdg.dataHome}/share/icons";
#   # };
#   # NOfonts = {
#   #   # enable = (if vars.workstation then true else false);
#   #   recursive = true;
#   #   source = config.lib.file.mkOutOfStoreSymlink "/run/current-system/sw/share/X11/fonts";
#   #   target = "${config.xdg.dataHome}/share/fonts";
#   # };
#   # HMthemes = {
#   #   # enable = (if vars.workstation then true else false);
#   #   recursive = true;
#   #   source = config.lib.file.mkOutOfStoreSymlink "${config.xdg.stateHome}/home-manager/gcroots/home-path/share/themes";
#   #   target = "${config.xdg.dataHome}/share/themes";
#   # };
#   HMicons = {
#     # enable = (if vars.workstation then true else false);
#     recursive = true;
#     source = config.lib.file.mkOutOfStoreSymlink "${config.xdg.stateHome}/home-manager/gcroots/home-path/share/icons";
#     target = "${config.xdg.dataHome}/share/icons";
#   };
#   HMfonts = {
#     # enable = (if vars.workstation then true else false);
#     recursive = true;
#     source = config.lib.file.mkOutOfStoreSymlink "${config.xdg.stateHome}/home-manager/gcroots/home-path/share/fonts";
#     target = "${config.xdg.dataHome}/share/fonts";
#   };
# };
# home.file.".local/share/flatpak/overrides/global".text = ''
#   [Context]
#   filesystems=/run/current-system/sw/share/X11/fonts:ro;/run/current-system/sw/share/icons:ro;/run/current-system/sw/share/themes:ro;${config.home.homeDirectory}/.local/share/fonts:ro;${config.home.homeDirectory}/.local/share/icons:ro;${config.home.homeDirectory}/.icons:ro;${config.home.homeDirectory}/.local/share/themes:ro;/nix/store:ro
# '';

