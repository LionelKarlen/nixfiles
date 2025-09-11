{
  lib,
  config,
  pkgs,
  ...
}:
lib.mkIf config.applications.browsers.brave.enable {
  home.packages = with pkgs; [
    brave
  ];
}
