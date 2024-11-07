{ config, pkgs, options, lib, ... }:
{
# Pick only one of the below networking options.
## Enables wireless support via wpa_supplicant.
# networking.wireless.enable = true;
## Easiest to use and most distros use this by default.
        networking = {
            networkmanager.enable = true;

            networkmanager.settings.connectivity.enabled=false;
            networkmanager.wifi = {
                powersave = false;
                backend = "iwd";
            };
            # extraHosts = ''
            #     127.0.0.2 other-localhost
            #     10.0.0.1 server
            # '';
            timeServers = [
                    "0.europe.pool.ntp.org"
                    "1.europe.pool.ntp.org"
                    "2.europe.pool.ntp.org"
                    "3.europe.pool.ntp.org"
                ];
        };
        # systemd.services.NetworkManager-wait-online.enable = false;
# Configure network proxy if necessary
# networking.proxy.default = "http://user:password@proxy:port/";
# networking.proxy.noProxy = "127.0.0.1,localhost,internal.domain";
# Open ports in the firewall.
# networking.firewall.allowedTCPPorts = [ ... ];
# networking.firewall.allowedUDPPorts = [ ... ];
# Or disable the firewall altogether.
# networking.firewall.enable = false;
}
