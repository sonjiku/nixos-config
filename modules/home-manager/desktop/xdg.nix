{ config, pkgs, ... }: {
    xdg = {
        enable = true;
        cacheHome = "${config.home.homeDirectory}/.cache";
        configHome = "${config.home.homeDirectory}/.config";
        dataHome = "${config.home.homeDirectory}/.local/share";
        stateHome = "${config.home.homeDirectory}/.local/state";


        userDirs = {
            enable = true;
            createDirectories = true;
            desktop = "${config.home.homeDirectory}/desktop";
            documents = "${config.home.homeDirectory}/documents";
            download = "${config.home.homeDirectory}/downloads";
            music = "${config.home.homeDirectory}/music";
            pictures = "${config.home.homeDirectory}/pictures";
            videos = "${config.home.homeDirectory}/videos";
            templates = "${config.home.homeDirectory}/templates";
            publicShare = "${config.home.homeDirectory}/public";
            extraConfig = {
                XDG_CODE_DIR = "${config.home.homeDirectory}/code";
                XDG_GAME_DIR = "${config.home.homeDirectory}/games";
                XDG_SCREENSHOTS_DIR = "${config.xdg.userDirs.pictures}/games";
            };
        };
        mimeApps = {
                enable = true;
                associations.added = {
                    "text/*" = [ "chromium-browser.desktop" ];
                    "x-scheme-handler/*" = [ "chromium-browser.desktop" ];
                    "application/*" = [ "chromium-browser.desktop" ];

                    "text/html" = [ "chromium-browser.desktop" ];
                    "text/xml" = [ "chromium-browser.desktop" ];
                    "text/uri-list" = [ "chromium-browser.desktop" ];
                    "text/x-uri" = [ "chromium-browser.desktop" ];
                    "application/xhtml_xml" = [ "chromium-browser.desktop" ];
                    "image/webp" = [ "chromium-browser.desktop" ];
                    "x-scheme-handler/http" = [ "chromium-browser.desktop" ];
                    "x-scheme-handler/https" = [ "chromium-browser.desktop" ];
                    "x-scheme-handler/ftp" = [ "chromium-browser.desktop" ];
                };
                defaultApplications = {
                    "inode/directory" = [ "pcmanfm.desktop" ];
                    "application/pdf" = [ "zathura.desktop" ];
                    "image/*" = [ "qimgv.desktop" ];
                    "text/*" = [ "nvim-qt.desktop" ];
                    "video/*" = [ "mpv.desktop" ];

                    "text/html" = [ "chromium-browser.desktop" ];
                    "text/xml" = [ "chromium-browser.desktop" ];
                    "text/http" = [ "chromium-browser.desktop" ];
                    "text/https" = [ "chromium-browser.desktop" ];
                    "text/uri-list" = [ "chromium-browser.desktop" ];
                    "text/x-uri" = [ "chromium-browser.desktop" ];
                    "application/xhtml_xml" = [ "chromium-browser.desktop" ];
                    "image/webp" = [ "chromium-browser.desktop" ];
                    "x-scheme-handler/http" = [ "chromium-browser.desktop" ];
                    "x-scheme-handler/https" = [ "chromium-browser.desktop" ];
                    "x-scheme-handler/ftp" = [ "chromium-browser.desktop" ];
                };
            };
    };

}
