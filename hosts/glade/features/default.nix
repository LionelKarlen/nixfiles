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

  home.packages =
    (with pkgs; [
      scarab
      qmk
      cowsay
      libresplit
      aoc-cli
    ])
    ++ (with pkgs-unstable; [
      obs-studio
    ]);
}
