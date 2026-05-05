{
  pkgs,
  pkgs-unstable,
  config,
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
      vintagestory = prev.callPackage ../../../packages/vintagestory/vintagestory.nix { };
      microcad = prev.callPackage ../../../packages/microcad/microcad.nix { };
      numbat = prev.callPackage ../../../packages/numbat/numbat.nix { };
      quoin = prev.callPackage ../../../packages/quoin/quoin.nix { };
    })
  ];

  home.file."${config.xdg.configHome}/quoin/dict.txt".source = ./files/quoin.txt;

  home.packages =
    (with pkgs; [
      scarab
      qmk
      cowsay
      libresplit
      aoc-cli
      vial
      vintagestory
      anki
      vscodium
      elan
      jellyfin-media-player
      beeref
      libreoffice
      rnote
      microcad
      numbat
      quoin
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
