{
  config,
  pkgs,
  ...
}: {
  ## Git Config
  programs.gh.enable = true;

  programs.git = {
    enable = true;
    package = pkgs.gitFull;
    userName = "sonjiku";
    userEmail = "dev.50nj1ku@erine.email";
    ignores = [
      "*~"
      ".*.swp"
      ".DS_Store"
    ];

    signing = {
      signByDefault = true;
      key = null;
    };
    extraConfig = {
      ## default branch name
      init.defaultBranch = "main";
      ## autocorrect
      help.autocorrect = 10;
      ## whitespace
      core = {
        whitespace = "trailing-space,space-before-tab";
      };
      # color.ui = false;
      ## url fixer
      url = {
        "git@github.com:" = {
          insteadOf = [
            "gh:"
          ];
          pushInsteadOf = [
            "https://github.com/"
          ];
        };
      };
      ## better diffing
      diff.algorithm = "histogram";
      ## plz no corruption
      transfer.fsckobjects = true;
      fetch.fsckobjects = true;
      receive.fsckObjects = true;
      ## Submodule stuff
      status.submoduleSummary = true;
      diff.submodule = "log";
      submodule.recurse = true;
      ## Automatically setup remote
      push.autoSetupRemote = true;
      ## better diffs for merges
      merge.conflictStyle="diff3";
      commit = {
        verbose = true;
        template = "${
          pkgs.writeText "commit_template.txt"
          ''
            Subject line (try to keep under 50 characters)

            Multi-line description of commit,
            feel free to be detailed.

            [Ticket: X]
          ''
        }";
      };
    };
    aliases = {
      edit = "commit --amend --only";
      co = "checkout";
      cp = "cherry-pick";
      sg = "stage";
      ss = "stash";
      st = "status";
    };
  };

  ## Direnv
  programs.direnv = {
    enable = true;
    # direnvrcExtra = ''
    #                 echo "direnv version: $(direnv --version)"
    #                 '';
    nix-direnv.enable = true;
  };

  home.packages = with pkgs; [
    python3Full
    shellcheck
    gcc
  ];
}
