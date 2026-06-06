{
  den.aspects.rust = {
    homeManager =
      { pkgs, ... }:
      {
        home.packages = with pkgs; [
          rustup
          bacon
          cargo-tarpaulin
        ];
      };
  };
}
