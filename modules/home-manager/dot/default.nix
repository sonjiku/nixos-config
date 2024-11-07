{
  lib,
  config,
  pkgs,
  ...
}: let
  configsdir = ./config;
  prg = builtins.attrNames (builtins.mapAttrs (file: type:
    if type == "directory"
    then builtins.echo "${file} is dir" "${file}"
    else builtins.echo "${file} isnt dir" null) (builtins.readDir configsdir));
in {
  imports = [
    ./music.nix
    ./nvim.nix
  ];

  xdg.dataFile."configfiles".text = builtins.concatStringsSep "\n" prg;
  xdg.configFile =
    builtins.listToAttrs
    (map (
        x: {
          name = "${x}";
          value = {
            source = config.lib.file.mkOutOfStoreSymlink "${config.xdg.userDirs.extraConfig.XDG_CODE_DIR}/nixos-config/modules/home-manager/dot/config/${x}";
          };
        }
      )
      prg);
}
