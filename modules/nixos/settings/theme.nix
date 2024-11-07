{
  config,
  lib,
  pkgs,
  ...
}: {
  qt = {
    enable = true;
    style = "gtk2";
    platformTheme = "gtk2";
  };
  ## fonts
  fonts = {
    fontDir.enable = true;
    packages = with pkgs; [
      (nerdfonts.override {fonts = ["JetBrainsMono"];})
      liberation_ttf
      noto-fonts-emoji
      fira-code-nerdfont
      fira-sans
      fira-go
      fira-math
      dm-sans
      vegur
      inriafonts
      prociono
      times-newer-roman
      comic-mono
      comic-neue
      comic-relief
      ia-writer-quattro
      gelasio
      libre-baskerville
    ];
    enableDefaultPackages = true;
    # fontconfig.defaultFonts = {
    #     monospace = ["JetBrains Mono Nerd Font"];
    #     serif = ["Liberation Serif"];
    #     sansSerif = ["Liberation Sans"];
    #     emoji = ["Noto Color Emoji"];
    # };
  };
}
