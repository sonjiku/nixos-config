{
  lib,
  config,
  pkgs,
  ...
}: let
  dotconfig-dir = ./config;
  config-dirs = builtins.attrNames (builtins.mapAttrs (file: type:
    if type == "directory"
    then builtins.echo "${file} is dir" "${file}"
    else builtins.echo "${file} isnt dir" null) (builtins.readDir dotconfig-dir));
  homeconfig-dir = ./home;
  home-configs = builtins.attrNames (builtins.mapAttrs (file: type:
    if type == "file" then
      builtins.echo "${file} is file" "${file}"
    else
      builtins.echo "${file} isnt file" null) (builtins.readDir homeconfig-dir));
in {
  imports = [
    ./music.nix
    ./nvim.nix
  ];

  # TODO: find a way to not use absolute path
  xdg.dataFile."configfiles".text = builtins.concatStringsSep "\n" config-dirs;
  xdg.configFile =
    builtins.listToAttrs
    (map (
        x: {
          name = "${x}";
          value = {
            source = config.lib.file.mkOutOfStoreSymlink "${config.xdg.configHome}/nixos/current/modules/home-manager/dot/config/${x}";
          };
        }
      )
      config-dirs);
  xdg.dataFile."homeconfigfiles".text = builtins.concatStringsSep "\n" home-configs;
  home.file =
    builtins.listToAttrs
    (map (
        y: {
          name = ".${y}";
          value = {
            source = config.lib.file.mkOutOfStoreSymlink "${config.xdg.configHome}/nixos/current/modules/home-manager/dot/home/${y}";
          };
        }
      )
      home-configs);
}
