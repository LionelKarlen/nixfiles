{
  lib,
  pkgs,
  ...
}: {
  nixpkgs.config.allowUnfreePredicate = pkg:
    builtins.elem (lib.getName pkg) [
      # Add additional package names here
      "discord"
      "vesktop"
      "spotify"
      "steam"
      "steam-unwrapped"
    ];

  home.packages = with pkgs; [
    discord
    vesktop
    steam
  ];
}
