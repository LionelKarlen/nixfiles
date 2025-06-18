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
      gc = "git commit -m";
      gcl = "git clone";
      ga = "git add";
      gaa = "git add -A";
      gs = "git status";
      gk = "git checkout";
      gb = "git branch";
      gph = "git push";
      gpl = "git pull";
      gd = "git diff";
      gi = ''
        git init
        wget https://github.com/lionelkarlen/template/archive/refs/heads/main.zip
        unzip main.zip
        mv ./template-main/* .
        rm -rf template-main main.zip
        git add -A
        git commit -m "chore: initial"
        echo finished setup
      '';
    };
  };
  programs.zsh = {
    shellAliases = {
      gl = "git log --oneline";
      gc = "git commit -m";
      gcl = "git clone";
      ga = "git add";
      gaa = "git add -A";
      gs = "git status";
      gk = "git checkout";
      gb = "git branch";
      gph = "git push";
      gpl = "git pull";
      gd = "git diff";
      gi = ''
        git init
        wget https://github.com/lionelkarlen/template/archive/refs/heads/main.zip
        unzip main.zip
        mv ./template-main/* .
        rm -rf template-main main.zip
        git add -A
        git commit -m "chore: initial"
        echo finished setup
      '';
    };
  };
}
