{ inputs, ... }:
{
  den.aspects.media = {
    homeManager =
      { pkgs, ... }:
      let
        pkgs-unstable = inputs.nixpkgs-unstable.legacyPackages.x86_64-linux;
      in
      {
        nixpkgs.overlays = [
          inputs.self.overlays.default
        ];
        programs.freetube = {
          enable = true;
          package = pkgs-unstable.freetube;
        };
      };
  };
}
