{
  config,
  lib,
  pkgs,
  ...
}:
{
  options = {
    git.enable = lib.mkEnableOption "enable git";
  };
  config = lib.mkIf config.git.enable {
    home.packages = with pkgs; [
      git
      git-credential-manager
      pass
      pinentry-tty
    ];

    programs.gpg = {
      enable = true;
      settings = {
        use-agent = true;
        batch-mode = false;
        pinentry-mode = "ask";
      };
    };

    services.gpg-agent = {
      enable = true;
      enableSshSupport = true;
      pinentry.package = pkgs.pinentry-curses;
    };

    programs.git = {
      enable = true;
      userName = "Lionel Karlen";
      userEmail = "lionel.karlen@protonmail.com";
      extraConfig = {
        init.defaultBranch = "main";
        url = {
          "https://github.com/" = {
            insteadOf = [
              "gh:"
              "github:"
            ];
          };
          "https://github.com/lionelkarlen/" = {
            insteadOf = [
              "glk:"
            ];
          };
        };
        credential = {
          helper = "manager";
          "https://github.com".username = "lionelkarlen";
          credentialStore = "gpg";
        };
      };
    };

    programs.zsh = {
      initContent = ''
        export GPG_TTY=$(tty)
      '';

      shellAliases = {
        gl = "git log --oneline";
        gc = "git commit";
        gaa = "git add -A";
        gs = "git status";
      };
    };
  };
}
