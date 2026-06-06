{ inputs, ... }:
{
  den.aspects.media = {
    homeManager =
      { pkgs, ... }:
      {
        nixpkgs.overlays = [
          inputs.self.overlays.default
        ];
        programs.freetube = {
          enable = true;
          package = pkgs.local.freetube;
        };
      };
  };
}
