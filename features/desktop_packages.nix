{
  config,
  lib,
  pkgs,
  pkgs-unstable,
  ...
}: {
  home.packages =
    (with pkgs; [
      zathura
      librewolf
      tor-browser
      protonvpn-gui
      kstars
      brave
      dolphin
    ])
    ++ (with pkgs-unstable; [
      freetube
      gnome-network-displays
    ]);
}
