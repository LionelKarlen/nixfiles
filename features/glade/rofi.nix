{
  config,
  lib,
  pkgs,
  ...
}: {
  home.packages = [
    pkgs.rofi-wayland
  ];
}
