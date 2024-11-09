{ config, pkgs, lib, ... }: {

    # nixpkgs.overlays = [
    #     (self: super: {
    #         tmux-bettersixel = (super.tmux.overrideAttrs (old: {
    #             pname = old.pname + "-bettersixel";
    #
    #             postPatch = ''
    #                 substituteInPlace ./input.c \
    #                     --replace-fail "#define INPUT_BUF_LIMIT 1048576" "#define INPUT_BUF_LIMIT 104857600"
    #             '';
    #
    #             postInstall = old.postInstall + ''
    #                 mkdir $out/source/
    #                 cp -r ./* $out/source/
    #             '';
    #         }));
    #     })
    # ];

    environment.systemPackages = with pkgs; [
        ## CLI
        imagemagick
        ### Archives
        p7zip
        unrar
        zip
        unzip
        ouch
        ### network fetching
        wget
        curl
        ### make
        gnumake
        ### Bundles
        ##### GNU
        coreutils
        inetutils
        findutils
        diffutils
        idutils
        recutils
        ##### GNU
        usbutils
        #### https://joeyh.name/code/moreutils/
        moreutils
        binutils
        #### https://mj.ucw.cz/sw/pciutils/
        pciutils
        psmisc
        ## modern utils
        ### Browsing
        lf
        yazi
        nnn
        ### find
        fd
        ripgrep
        ripgrep-all
        fzf
        #
        yt-dlp
        ## Misc
        htop
        ## Cooler than cat
        bat
        ## System info fetchers
        hyfetch
        afetch
        cowsay
        fortune
        lolcat
        ffmpeg
        chafa
        file
        libsixel
        trash-cli
        tree
        eza
        pistol
        # tmux-bettersixel
        tmux
        ## important device utils
        ntfs3g
        smartmontools
    ];
}
