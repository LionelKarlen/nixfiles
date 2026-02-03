{
  lib,
  config,
  pkgs,
  ...
}:
lib.mkIf config.applications.discord.enable {
  home.packages = [
    pkgs.discord-canary
  ];
}
