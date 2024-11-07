{
  config,
  lib,
  pkgs,
  modulesPath,
  ...
}: {
  imports = [
    ./hardware-configuration.nix

    ../../hardware/mouse.nix
    ../../hardware/audio.nix
    ../../hardware/laptop/default.nix
    ../../hardware/laptop/power.nix
    ../../hardware/keyboard.nix
    ../../hardware/bluetooth.nix
    ../../hardware/network.nix
  ];

  hardware.enableAllFirmware = true;
  hardware.enableRedistributableFirmware = true;
  # hardware support
  ##  Make touchpad work
  boot.kernelModules = ["synaptics_usb"];
  ## AMD CPU
  hardware.cpu.amd.updateMicrocode = true;
  ## AMD GPU
  # boot.initrd.kernelModules = [ "amdgpu" ];
  # boot.kernelModules = [ "kvm-amd" ];
  # disable Scatter/Gather APU recently enabled by default,
  # which results in white screen after display reconfiguration
  # boot.kernelParams = [ "amdgpu.sg_display=0" ];
  ### enable hip
  # systemd.tmpfiles.rules = [
  #     "L+    /opt/rocm/hip   -    -    -     -    ${pkgs.rocmPackages.clr}"
  # ];
  ### opengl
  hardware.graphics = {
    enable = true;
    # enable32 = true;
    # extraPackages = with pkgs; [
    #     rocm-opencl-icd
    #     rocm-opencl-runtime
    #     amdvlk
    # ];
    # extraPackages32 = with pkgs; [
    #     driversi686Linux.amdvlk
    # ];
  };
  # services.udev = {
  #   enable = true;
  #   extraRules = ''
  #     # Enable left middle right for touchpad
  #     ENV{ID_VENDOR_ID}=="ELAN0708:00 04F3:30A0 Touchpad", ENV{PULSE_IGNORE}="1"
  #   '';
  # };
}
