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
      libresplit
    ])
    ++ (with pkgs-unstable; [
      obs-studio
    ]);
}
