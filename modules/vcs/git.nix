{
  den.aspects.vcs = {
    homeManager =
      { pkgs, ... }:
      {
        home.packages = with pkgs; [
          git-credential-manager
          delta
        ];

        programs.git = {
          enable = true;
          settings = {
            user = {
              name = "Lionel Karlen";
              email = "lionel.karlen@protonmail.com";
            };
            init.defaultBranch = "main";
            core.pager = "delta";
            interactive.diffFilter = "delta --color-only";
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
          shellAliases = {
            gl = "git log --oneline";
            gc = "git commit";
            gaa = "git add -A";
            gs = "git status -s";
            gd = "git diff HEAD";
          };
        };
      };
  };
}
