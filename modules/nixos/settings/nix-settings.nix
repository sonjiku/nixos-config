{
  config,
  pkgs,
  ...
}: {
  ## nixpkgs config
  nixpkgs.config = {
    allowUnfree = true;
    chromium = {
      enableWideVine = true;
    };
  };

  ### NIX Config
  nix = {
    optimise = {
      automatic = true;
      dates = ["03:45"];
    };
    gc = {
      automatic = true;
      dates = "weekly";
      options = "--delete-older-than 7d";
    };
    settings = {
      sandbox = true;
      # extra-sandbox-paths = [ "/etc/nix/netrc" ];
      # trusted-users = [ "root" "${config.suites.single-user.user}" ];
      # substituters = [ "https://cachix.cachix.org" ];
      experimental-features = ["nix-command" "flakes" "auto-allocate-uids" "configurable-impure-env"];
      # netrc-file = "/etc/nix/netrc";
      auto-optimise-store = true;
      log-lines = 100;
      warn-dirty = false;
    };
    package = pkgs.nixVersions.git;
  };

  # Copy the NixOS configuration file and link it from the resulting system
  # (/run/current-system/configuration.nix). This is useful in case you
  # accidentally delete configuration.nix.
  # system.copySystemConfiguration = true;

  # This value determines the NixOS release from which the default
  # settings for stateful data, like file locations and database versions
  # on your system were taken. It's perfectly fine and recommended to leave
  # this value at the release version of the first install of this system.
  # Before changing this value read the documentation for this option
  # (e.g. man configuration.nix or on https://nixos.org/nixos/options.html).
  system.stateVersion = "23.05"; # Did you read the comment?
}
