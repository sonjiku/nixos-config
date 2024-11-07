{
  config,
  pkgs,
  inputs,
  ...
}: {
  programs = {
    firefox.enable = true;
    chromium = {
      enable = true;
      package = pkgs.ungoogled-chromium;
      dictionaries = [
        pkgs.hunspellDictsChromium.en_US
      ];
      extensions = [
        # {
        #   ## crxPath	Path to the extension's crx file. Linux only.	null or path
        #   ## id	The extension's ID from the Chrome Web Store url or the unpacked crx.	string matching the pattern [a-zA-Z]{32}
        #   ## updateUrl	URL of the extension's update manifest XML file. Linux only.	string
        #   ## version
        #   updateUrl = "https://github.com/NeverDecaf/chromium-web-store/blob/master/updates.xml";
        #   version = "1.5.4.3";
        # }
        ## Ublock origin
        {id = "cjpalhdlnbpafiamejdnhcphjbkeiagm";}
        ## metamask
        {id = "nkbihfbeogaeaoehlefnkodbefgpgknn";}
        ## https://chromewebstore.google.com/detail/exodus-web3-wallet/aholpfdialjgjfhomihkjbmgjidlcdno
        {id = "aholpfdialjgjfhomihkjbmgjidlcdno";}
        ## https://chromewebstore.google.com/detail/keepassxc-browser/oboonakemofpalcgghocfoadofidjkkk
        {id = "oboonakemofpalcgghocfoadofidjkkk";}
        ## https://chromewebstore.google.com/detail/decentraleyes/ldpochfccmkkmhdbclfhpagapcfdljkj
        {id = "ldpochfccmkkmhdbclfhpagapcfdljkj";}
        ## https://chromewebstore.google.com/detail/google-translate/aapbdbdomjkkjkaonfhkkikfgjllcleb
        {id = "aapbdbdomjkkjkaonfhkkikfgjllcleb";}
        ## https://chromewebstore.google.com/detail/better-history/egehpkpgpgooebopjihjmnpejnjafefi
        {id = "egehpkpgpgooebopjihjmnpejnjafefi";}
        ## https://chromewebstore.google.com/detail/return-youtube-dislike/gebbhagfogifgggkldgodflihgfeippi
        {id = "gebbhagfogifgggkldgodflihgfeippi";}
        ## https://chromewebstore.google.com/detail/sponsorblock-for-youtube/mnjggcdmjocbbbhaepdhchncahnbgone
        {id = "mnjggcdmjocbbbhaepdhchncahnbgone";}
        ## https://chromewebstore.google.com/detail/session-buddy/edacconmaakjimmfgnblocblbcdcpbko
        {id = "edacconmaakjimmfgnblocblbcdcpbko";}
        ## https://chromewebstore.google.com/detail/shazam-find-song-names-fr/mmioliijnhnoblpgimnlajmefafdfilb
        {id = "mmioliijnhnoblpgimnlajmefafdfilb";}
      ];
    };
    # zathura.enable = true;
    mpv.enable = true;
  };

  home.packages = [
    ## file manager
    pkgs.fm
    pkgs.pcmanfm
    ## images
    pkgs.nsxiv
    pkgs.qimgv
    pkgs.zathura
    ### bowserxdg-open https://www.archlinux.org
    pkgs.ungoogled-chromium
    ### production
    pkgs.musescore
    pkgs.muse-sounds-manager
    pkgs.gimp
    pkgs.inkscape
    pkgs.kdenlive
  ];
}
