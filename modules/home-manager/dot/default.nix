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
    if type == "directory"
    then builtins.echo "${file} is dir" null
    else builtins.echo "${file} isnt dir" "${file}") (builtins.readDir homeconfig-dir));
in {
  imports = [
    ./music.nix
    ./nvim.nix
  ];

  # TODO: find a way to not use absolute path
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
  xdg.homeFile =
    builtins.listToAttrs
    (map (
        x: {
          name = "${x}";
          value = {
            source = config.lib.file.mkOutOfStoreSymlink "${config.xdg.configHome}/nixos/current/modules/home-manager/dot/home/${x}";
          };
        }
      )
      home-configs);
}
