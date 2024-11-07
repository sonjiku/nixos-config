{
  description = "main flake";
  nixConfig = {
    extra-substituters = [
      "https://nix-community.cachix.org"
      "https://hyprland.cachix.org"
    ];
    extra-trusted-public-keys = [
      "nix-community.cachix.org-1:mB9FSh9qf2dCimDSUo8Zy7bkq5CX+/rkCWyvRCYg3Fs="
      "hyprland.cachix.org-1:a7pgxzMz7+chwVL3/pzj6jIBMioiJM7ypFP8PwtkuGc="
    ];
  };

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
    nixos-hardware = {
      url = "github:NixOS/nixos-hardware/master";
    };
    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    musnix = {
      url = "github:musnix/musnix";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    stylix = {
      url = "github:danth/stylix";
      inputs = {
        home-manager.follows = "home-manager";
        nixpkgs.follows = "nixpkgs";
      };
    };
    flake-utils.url = "github:numtide/flake-utils";

    ## specific pkgs
    wezterm = {
      url = "github:wez/wezterm/main?dir=nix";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    hyprland = {
      url = "github:hyprwm/Hyprland";
    };
    zen-browser.url = "github:MarceColl/zen-browser-flake";
  };

  outputs = inputs @ {
    self,
    nixpkgs,
    nixos-hardware,
    home-manager,
    musnix,
    stylix,
    ...
  }: let
    system = "x86_64-linux";
    hostname = "kunix";
    username = "sonji";
    pkgs = nixpkgs.legacyPackages.${system};
  in {
    nixosConfigurations = {
      ${hostname} = nixpkgs.lib.nixosSystem {
        inherit system;
        specialArgs = {inherit inputs hostname username;};
        modules = [
          # Main
          ./modules/nixos/configuration.nix
          ./modules/home-manager/nixos-module

          # Home Manager
          home-manager.nixosModules.home-manager
          {
            home-modules.stylix.enable = true;
            # imports = [
            #   ./home-manager/nixos-module
            # ];
            home-manager = {
              useGlobalPkgs = true;
              useUserPackages = true;
              users.${username} = {
                imports = [
                  ./modules/home-manager/home.nix
                ];
                home = {
                  username = "${username}";
                  homeDirectory = "/home/${username}";
                };
              };
            };
          }
          # Musnix

          musnix.nixosModules.musnix
          {
            musnix = {
              enable = true;
              alsaSeq.enable = true;
              ffado.enable = true;
              soundcardPciId = "04:00.6";
              rtirq.enable = true;
              das_watchdog.enable = true;
            };
          }
          stylix.nixosModules.stylix
          {
            imports = [
              ./modules/stylix
            ];
          }
          # Hardware optimizations for laptop
          nixos-hardware.nixosModules.common-cpu-amd
          nixos-hardware.nixosModules.common-cpu-amd-pstate
          nixos-hardware.nixosModules.common-gpu-amd
          nixos-hardware.nixosModules.common-pc-laptop
          nixos-hardware.nixosModules.common-pc-laptop-acpi_call
          nixos-hardware.nixosModules.common-pc-laptop-ssd
        ];
      };
    };
  };
}
