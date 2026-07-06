{ inputs, ... }:
{
  den.aspects.media = {
    homeManager =
      { ... }:
      let
        pkgs-unstable = inputs.nixpkgs-unstable.legacyPackages.x86_64-linux;
      in
      {
        nixpkgs.overlays = [
          inputs.self.overlays.default
        ];
        programs.freetube = {
          enable = true;
          package =
            with pkgs-unstable;
            (symlinkJoin {
              name = "freetube";
              paths = [ freetube ];
              buildInputs = [ makeWrapper ];
              postBuild = ''
                wrapProgram $out/bin/freetube --add-flags "--disable-gpu"
              '';
            });
        };
      };
  };
}
