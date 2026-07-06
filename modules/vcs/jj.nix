{
  den.aspects.vcs = {
    homeManager = {
      programs.jujutsu = {
        enable = true;
        settings = {
          user = {
            name = "Lionel Karlen";
            email = "lionel.karlen@protonmail.com";
          };
          ui.default-command = "log";
          aliases.tug = [
            "bookmark"
            "move"
            "--from"
            "heads(::@- & bookmarks())"
            "--to"
            "@-"
          ];
        };
      };
    };
  };
}
