{ config, pkgs, ... }: {
    home.packages = with pkgs; [ 
        mpd
        mpc-cli
        rmpc
        (ncmpcpp.override { visualizerSupport = true; })
        cava
        beets
        playerctl
        python312Packages.requests
        python312Packages.beautifulsoup4
        giada
    ];
}
