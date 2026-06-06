{
  den.aspects.shell = {
    homeManager = {
      programs.zoxide.enable = true;
      programs.zsh.shellAliases = {
        cd = "z";
      };
    };
  };
}
