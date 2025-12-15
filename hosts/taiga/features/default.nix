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
    ./notifications.nix
  ];

  home.packages =
    (with pkgs; [
      audacity
      obsidian
    ])
    ++ (with pkgs-unstable; [
    ]);
}
