{
  config,
  pkgs,
  ...
}: {
  programs.neovim = {
    enable = true;
    withRuby = true;
    withNodeJs = true;
    withPython3 = true;
    # viAlias = true;
    # vimAlias = true;
    extraPackages = with pkgs; [
      yarn
      cargo
      tree-sitter
      ## Lua lsp
      luajitPackages.luarocks
      # pkgs.marksman
      lua-language-server
      ## bash
      bash-language-server
      ## Nix lsp
      nixd
      nil
      alejandra
      nixfmt-rfc-style
      nixfmt-classic
      ## Python dev
      basedpyright
      ruff
      python312Packages.debugpy
      ## NPM
      nodePackages.livedown
      nodejs_22
    ];
  };
  home.packages = [
    # pkgs.neovim
    # pkgs.neovim-qt
  ];
}
