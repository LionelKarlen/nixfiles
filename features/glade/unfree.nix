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
    ];

  home.packages = with pkgs; [
    discord
    vesktop
  ];
}
