{
  den.aspects.haskell = {
    homeManager =
      { pkgs, ... }:
      {
        home.packages = with pkgs; [
          ghc
          haskell-language-server
          stack
          cabal-install
        ];
      };
  };
}
