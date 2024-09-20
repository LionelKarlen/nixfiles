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
}
