{ config, pkgs, lib, ... }: {

# # Kernel Settings
#     boot = {
# ## Set swapiness
#         kernel.sysctl = { "vm.swappiness" = 10; };
# ## AlsaSeq
#         kernelModules = [ "snd-seq" "snd-rawmidi" ];
# ## ThreadIrqs
#         kernelParams = [ "threadirqs" ];
# ## Soundcard LatencyTimer
#         # postBootCommands = ''
#         #     ${pkgs.pciutils}/bin/setpci -v -d *:* latency_timer=b0
#         #     ${pkgs.pciutils}/bin/setpci -v -s "04:00.06" latency_timer=ff
#         # '';
#     };
#
# # PowerManagement
#     powerManagement.cpuFreqGovernor = "performance";
#
#
# # Pam memory limits
#     security.pam.loginLimits = [
#       { domain = "@audio"; item = "memlock"; type = "-"   ; value = "unlimited"; }
#       { domain = "@audio"; item = "rtprio" ; type = "-"   ; value = "99"       ; }
#       { domain = "@audio"; item = "nofile" ; type = "soft"; value = "99999"    ; }
#       { domain = "@audio"; item = "nofile" ; type = "hard"; value = "99999"    ; }
#     ];
#
# # Udev rules
#     services.udev = {
#         packages = [ pkgs.ffado ];
#         extraRules = ''
#             KERNEL=="rtc0", GROUP="audio"
#             KERNEL=="hpet", GROUP="audio"
#         '';
#     };
#
# # RtIrq
#         environment.etc."rtirq.conf".source = ./config/rtirq.conf;
#         systemd.services.rtirq = {
#         description = "IRQ thread tuning for realtime kernels";
#         after = [ "multi-user.target" "sound.target" ];
#         wantedBy = [ "multi-user.target" ];
#         path = with pkgs; [
#             gawk
#             gnugrep
#             gnused
#             procps
#         ];
#         serviceConfig = {
#             User = "root";
#             Type = "oneshot";
#             ExecStart = "${pkgs.rtirq}/bin/rtirq start";
#             ExecStop = "${pkgs.rtirq}/bin/rtirq stop";
#             RemainAfterExit = true;
#         };
#     };
#
# # Das watchdog
#     services.das_watchdog.enable = true;
#
# # Plugin directories
#     environment.variables = let
#         makePluginPath = format:
#             (makeSearchPath format [
#             "$HOME/.nix-profile/lib"
#             "/run/current-system/sw/lib"
#             "/etc/profiles/per-user/$USER/lib"
#             ])
#             + ":$HOME/.${format}";
#     in {
#         DSSI_PATH   = makePluginPath "dssi";
#         LADSPA_PATH = makePluginPath "ladspa";
#         LV2_PATH    = makePluginPath "lv2";
#         LXVST_PATH  = makePluginPath "lxvst";
#         VST_PATH    = makePluginPath "vst";
#         VST3_PATH   = makePluginPath "vst3";
#     };

# Packages
    environment.systemPackages = with pkgs; [
## Libs
        # ffado
        # rtirq
## Programs
        ardour
## plugins
        lsp-plugins
        
        mda_lv2
        swh_lv2
        gxplugins-lv2
        bolliedelayxt-lv2
        # airwindows-lv2
        rkrlv2
        distrho
        # artyFX
        dragonfly-reverb

        kapitonov-plugins-pack

        x42-plugins
        x42-avldrums
        calf
        carla
        luppp
        zynaddsubfx
        # petrifoo
        sooperlooper
        # bjumblr
        geonkick

        ChowKick
        ChowPhaser
        CHOWTapeModel
        ChowCentaur

    ];
}
