{
  den.aspects.pass = {
    homeManager =
      { pkgs, ... }:
      {
        home.packages = with pkgs; [ proton-pass ];
      };
  };
}
