{
  lib,
  config,
  pkgs,
  ...
}:
{
  nixpkgs.config.allowUnfreePredicate =
    pkg:
    builtins.elem (pkgs.lib.getName pkg) [
      "steam"
      "steam-unwrapped"
    ];

  home.packages = lib.optionals (config.applications.games.steam.enable) [
    pkgs.steam
  ];
}
