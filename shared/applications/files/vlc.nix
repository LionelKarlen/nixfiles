{
  lib,
  config,
  pkgs,
  ...
}:
lib.mkIf config.applications.files.vlc.enable {
  home.packages = with pkgs; [
    vlc
  ];
}
