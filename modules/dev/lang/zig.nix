{
  den.aspects.zig = {
    homeManager =
      { pkgs, ... }:
      {
        home.packages = with pkgs; [
          zig
          zls
        ];
      };
  };
}
