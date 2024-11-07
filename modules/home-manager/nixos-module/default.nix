{
  config,
  pkgs,
  ...
}:{
  # Home Manager needs a bit of information about you and the paths it should
  # manage.
  imports = [
    ./flatpak.nix
  ];
  # options.allusers = builtins.trace "Debuggin Message:" + (builtins.attrNames config.home-manager.users);
}
