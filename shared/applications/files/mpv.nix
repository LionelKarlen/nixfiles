{
  lib,
  config,
  pkgs,
  ...
}:
lib.mkIf config.applications.files.mpv.enable {
  home.packages = with pkgs; [
    mpv
  ];
}
