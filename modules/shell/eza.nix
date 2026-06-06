{
  den.aspects.shell = {
    homeManager =
      { pkgs, ... }:
      {
        home.packages = [ pkgs.eza ];
        programs.zsh.shellAliases = {
          ls = "eza";
        };
      };
  };
}
