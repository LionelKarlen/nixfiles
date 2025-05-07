{
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
      };
    };
  };
  programs.bash = {
    shellAliases = {
      gl = "git log --oneline";
      gc = "git commit -m";
      ga = "git add";
      gaa = "git add -A";
      gs = "git status";
      gk = "git checkout";
      gb = "git branch";
    };
  };
}
