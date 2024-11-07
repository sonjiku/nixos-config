{ config, pkgs, lib, ... }:
{
    powerManagement = {
            enable = true;
        };
# power saving
    services.acpid.enable = true;
    services.upower.enable = true;
    services.thermald.enable = true;
# Auto-cpufreq
    services.auto-cpufreq = {
        enable = true;
        settings = {
            battery = {
                governor = "powersave";
                turbo = "never";
            };
            charger = {
                governor = "performance";
                turbo = "never";
            };
        };
    };

## tlp
#     services.tlp = {
#         enable = true;
#         settings = {
# ### Profile
#             # PLATFORM_PROFILE_ON_AC = "performance";
#             # PLATFORM_PROFILE_ON_BAT = "schedutil";
# ### CPU
#             CPU_SCALING_GOVERNOR_ON_AC = "performance";
#             CPU_SCALING_GOVERNOR_ON_BAT = "powersave";
#             CPU_MIN_PERF_ON_AC = 0;
#             CPU_MAX_PERF_ON_AC = 100;
#             CPU_MIN_PERF_ON_BAT = 0;
#             CPU_MAX_PERF_ON_BAT = 40;
#             CPU_BOOST_ON_AC = 1;
#             CPU_BOOST_ON_BAT = 0;
#             # SCHED_POWERSAVE_ON_AC = 0;
#             # SCHED_POWERSAVE_ON_BAT = 1;
# ### GPU
#             # RADEON_DPM_PERF_LEVEL_ON_AC = "high";
#             # RADEON_DPM_PERF_LEVEL_ON_BAT = "low";
#             # RADEON_DPM_STATE_ON_AC = "performance";
#             # RADEON_DPM_STATE_ON_BAT = "battery";
# ### Bluetooth
#             USB_EXCLUDE_BTUSB = 1;
# ### Always charge phone
#             USB_EXLUDE_PHONE = 1;
# ### Dont autosuspend
#             USB_AUTOSUSPEND = 0;
# ### WIFI
#             WIFI_PWR_ON_BAT = "off";
#         };
#     };
}
