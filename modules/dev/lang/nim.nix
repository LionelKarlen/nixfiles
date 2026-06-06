{
  den.aspects.nim = {
    homeManager =
      { pkgs, ... }:
      {
        home.packages = with pkgs; [
          nim
          nimble
          nimlangserver
        ];
      };
  };
}
