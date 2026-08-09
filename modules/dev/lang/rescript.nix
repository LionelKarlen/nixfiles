{ inputs, ... }: {
  den.aspects.rescript = {
    homeManager =
      { pkgs, ... }:
      {
        nixpkgs.overlays = [
          inputs.self.overlays.default
        ];
        home.packages = [
          pkgs.local.rescript-lsp
        ];
      };
  };
}
