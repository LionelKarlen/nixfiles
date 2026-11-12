{ inputs, ... }:
{
  den.aspects.media =

    let
      pkgs-unstable = inputs.nixpkgs-unstable.legacyPackages.x86_64-linux;
    in
    {
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
                # paths = [ local.freetube ];
                paths = [ pkgs-unstable.freetube ];
                buildInputs = [ makeWrapper ];
                postBuild = ''
                  wrapProgram $out/bin/freetube --add-flags "--disable-gpu"
                '';
              });
          };
        };
    };
}
