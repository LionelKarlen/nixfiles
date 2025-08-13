{pkgs, ...}: {
  imports = [
    ./creds.nix
  ];

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
      credential = {
        helper = "manager";
        "https://github.com".username = "lionelkarlen";
        credentialStore = "gpg";
      };
    };
  };
  programs.bash = {
    shellAliases = {
      gl = "git log --oneline";
      gc = "git commit";
      gaa = "git add -A";
      gs = "git status";
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
}
