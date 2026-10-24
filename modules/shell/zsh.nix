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
          # cd into directory because it just opens files
          # so the root folder is ~, making enumeration really annoying
          tray = "cd ~/tray && hx --vsplit inbox.kdl next/todo.kdl";
          notebook = "hx ~/notebook";
        };
        initContent = ''
          KEYTIMEOUT=10
        '';
      };
    };

  };
}
