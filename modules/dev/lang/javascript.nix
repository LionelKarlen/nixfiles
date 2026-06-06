{
  den.aspects.javascript = {
    homeManager =
      { pkgs, ... }:
      {
        home.packages = with pkgs; [
          nodejs_latest
          pnpm
          typescript-language-server
          typescript
        ];
      };
  };
}
