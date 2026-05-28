{
  lib,
  config,
  pkgs,
  pkgs-unstable,
  ...
}:
lib.mkIf config.applications.discord.enable {
  home.packages = [
    pkgs-unstable.vesktop
  ];
}
