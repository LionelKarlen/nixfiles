{
  den.aspects.shell = {
    nixos =
      { pkgs, ... }:
      {
        users.defaultUserShell = pkgs.zsh;
        programs.zsh.enable = true;
      };

    homeManager = {
      home.shell.enableZshIntegration = true;

      programs.zsh = {
        enable = true;
        shellAliases = {
          org = "$EDITOR ~/org/tasks.todo.txt";
          vault = "$EDITOR ~/vault";
        };
        initContent = ''
          KEYTIMEOUT=10
        '';
      };
    };

  };
}
