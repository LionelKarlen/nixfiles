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
  ];

  home.packages =
    (with pkgs; [
      scarab
      qmk
      cowsay
    ])
    ++ (with pkgs-unstable; [
      obs-studio
    ]);
}
