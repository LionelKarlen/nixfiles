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
          package =
            with pkgs;
            (symlinkJoin {
              name = "freetube";
              paths = [ local.freetube ];
              buildInputs = [ makeWrapper ];
              postBuild = ''
                wrapProgram $out/bin/freetube --add-flags "--disable-gpu"
              '';
            });
        };
      };
  };
}
