{
  programs.git = {
    enable = true;
    config = {
      init.defaultBranch = "main";
      user.name = "Lionel Karlen";
      user.email = "lionel.karlen@protonmail.com";
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
