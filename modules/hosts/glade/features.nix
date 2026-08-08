{ inputs, ... }:
let
  pkgs-unstable = inputs.nixpkgs-unstable.legacyPackages.x86_64-linux;
in
{
  den.aspects.lionel = {
    provides.glade = {
      homeManager =
        { pkgs, ... }:
        {
          nixpkgs.overlays = [
            inputs.self.overlays.default
          ];
          home.packages =
            (with pkgs; [
              qmk
              aoc-cli
              vial
              anki
              libreoffice
              local.numbat
            ])
            ++ (with pkgs-unstable; [
              microcad
              f3d
              obs-studio
              orca-slicer
              (symlinkJoin {
                name = "freecad";
                paths = [ freecad ];
                buildInputs = [ makeWrapper ];
                postBuild = ''
                  wrapProgram $out/bin/freecad --set QT_QPA_PLATFORM xcb
                '';
              })
            ]);

        };
    };

  };
}
