{
  lib,
  config,
  pkgs,
  ...
}:
lib.mkIf config.applications.spotify.enable {
  programs.spicetify.enable = true;
}
