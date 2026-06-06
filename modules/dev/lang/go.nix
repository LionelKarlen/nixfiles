{
  den.aspects.go = {
    homeManager =
      { pkgs, ... }:
      {
        home.packages = with pkgs; [
          go
          gopls
        ];
      };
  };
}
