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
  # TODO: Move credentials to separate module
  imports = [
    # ./creds.nix
  ];
  config = lib.mkIf config.git.enable {
    # TODO: Move credentials to separate module
    home.packages = with pkgs; [
      git
      git-credential-manager
    ];

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
        # TODO: Move credentials to separate module
        credential = {
          helper = "manager";
          "https://github.com".username = "lionelkarlen";
          credentialStore = "gpg";
        };
      };
    };

    programs.zsh = {
      shellAliases = {
        gl = "git log --oneline";
        gc = "git commit";
        gaa = "git add -A";
        gs = "git status";
      };
    };
  };
}
