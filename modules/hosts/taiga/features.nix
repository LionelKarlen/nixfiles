{ inputs, ... }:
let
  pkgs-unstable = inputs.nixpkgs-unstable.legacyPackages.x86_64-linux;
in
{
  den.aspects.eepy = {
    provides.taiga = {
      homeManager =
        { pkgs, ... }:
        {
          nixpkgs.overlays = [
            inputs.self.overlays.default
          ];
          home.packages = (
            with pkgs;
            [
              audacity
              local.numbat
            ]
          );
        };
    };

  };
}
