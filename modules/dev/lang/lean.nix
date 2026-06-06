{
  den.aspects.lean = {
    homeManager =
      { pkgs, ... }:
      {
        home.packages = with pkgs; [
          elan
          vscodium
        ];
      };
  };
}
