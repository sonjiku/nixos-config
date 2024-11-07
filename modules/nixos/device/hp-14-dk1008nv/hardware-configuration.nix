{
  config,
  lib,
  pkgs,
  modulesPath,
  ...
}: {
  imports = [
    (modulesPath + "/installer/scan/not-detected.nix")
  ];

  boot.initrd.availableKernelModules = ["nvme" "xhci_pci" "usbhid" "usb_storage" "sd_mod"];
  boot.extraModulePackages = [];
  boot.kernelParams = [
    # "splash"
    # "rd.systemd.show_status=false" "rd.udev.log_level=3"
    "boot.shell_on_fail"
    "i8042.nopnp"
  ];

  # FS stuff
  fileSystems."/" = {
    device = "/dev/disk/by-uuid/57a24628-8308-44f5-bcd9-e47c886831c8";
    fsType = "btrfs";
    options = ["subvol=root" "compress=zstd"];
  };

  fileSystems."/boot" = {
    device = "/dev/disk/by-uuid/E71B-EC78";
    fsType = "vfat";
  };

  fileSystems."/home" = {
    device = "/dev/disk/by-uuid/57a24628-8308-44f5-bcd9-e47c886831c8";
    fsType = "btrfs";
    options = ["subvol=home" "compress=zstd"];
  };

  fileSystems."/nix" = {
    device = "/dev/disk/by-uuid/57a24628-8308-44f5-bcd9-e47c886831c8";
    fsType = "btrfs";
    options = ["subvol=nix" "compress=zstd" "noatime"];
  };

  # Swap
  fileSystems."/swap" = {
    device = "/dev/disk/by-uuid/57a24628-8308-44f5-bcd9-e47c886831c8";
    fsType = "btrfs";
    options = ["subvol=swap" "noatime"];
  };
  swapDevices = [{device = "/swap/swapfile";}];

  # Enables DHCP on each ethernet and wireless interface. In case of scripted networking
  # (the default) this is the recommended approach. When using systemd-networkd it's
  # still possible to use this option, but it's recommended to use it in conjunction
  # with explicit per-interface declarations with `networking.interfaces.<interface>.useDHCP`.
  networking.useDHCP = lib.mkDefault true;
  # networking.interfaces.eno1.useDHCP = lib.mkDefault true;
  # networking.interfaces.wlp3s0.useDHCP = lib.mkDefault true;

  nixpkgs.hostPlatform = lib.mkDefault "x86_64-linux";
  hardware.enableRedistributableFirmware = true;
}
