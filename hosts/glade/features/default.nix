{
  pkgs,
  pkgs-unstable,
  ...
}:
{
  imports = [
    ./hyprland.nix
    ./rofi.nix
    ./theme.nix
    ./noise.nix
    ./notifications.nix
  ];

  nixpkgs.overlays = [
    (final: prev: {
      cria = prev.callPackage ../../../packages/cria/cria.nix { };
      vintagestory = prev.callPackage ../../../packages/vintagestory/vintagestory.nix { };
    })
  ];

  home.packages =
    (with pkgs; [
      scarab
      qmk
      cowsay
      libresplit
      aoc-cli
      vial
      cria
      vintagestory
      anki
      vscodium
      elan
    ])
    ++ (with pkgs-unstable; [
      obs-studio
      (symlinkJoin {
        name = "bambu-studio";
        paths = [ bambu-studio ];
        buildInputs = [ makeWrapper ];
        postBuild = ''
          wrapProgram $out/bin/bambu-studio --set WAYLAND_DISPLAY 1 --set XDG_SESSION_TYPE x11 --set GBM_BACKEND dri
        '';
      })
      (symlinkJoin {
        name = "freecad";
        paths = [ freecad ];
        buildInputs = [ makeWrapper ];
        postBuild = ''
          wrapProgram $out/bin/freecad --set QT_QPA_PLATFORM xcb
        '';
      })
      orca-slicer
    ]);
}
