{ den, ... }:
{
  den.aspects.edu = {
    includes = [ (den.batteries.unfree [ "obsidian" ]) ];
    homeManager =
      { pkgs, ... }:
      {
        home.packages = with pkgs; [ obsidian ];
      };
  };
}
