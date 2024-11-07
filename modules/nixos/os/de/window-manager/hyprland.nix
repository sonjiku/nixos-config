{
  config,
  pkgs,
  lib,
  inputs,
  username,
  ...
}: {
  # home-manager.users.${username} = import ../../../../home-manager/programs/hyprland.nix{inherit inputs pkgs config lib;};

  programs.hyprland = {
    enable = true;
    xwayland.enable = true;
    package = inputs.hyprland.packages.${pkgs.stdenv.hostPlatform.system}.hyprland;
    # make sure to also set the portal package, so that they are in sync
    portalPackage = inputs.hyprland.packages.${pkgs.stdenv.hostPlatform.system}.xdg-desktop-portal-hyprland;
  };
  # programs.hyprlock = {
  #   enable = true;
  # };
  # environment.systemPackages = with pkgs; [
  #   hypridle
  # ];
}
