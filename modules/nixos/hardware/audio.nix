{ config, pkgs, lib, ... }: {

# Audio Settings
    # musnix.enable = true;
    # sound.enable = true; Deprecated?
    # sound.mediaKeys.enable = true;
    services.pipewire = {
        enable = true;
        audio.enable = true;
        alsa.enable = true;
        jack.enable = true;
        pulse.enable = true;
        wireplumber.enable = true;
    };

    programs.noisetorch.enable = true;

    environment.systemPackages = with pkgs; [
### Pavucontrol
            pavucontrol
### muprod
            qpwgraph
    ];
}
