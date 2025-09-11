{
  lib,
  config,
  pkgs,
  ...
}:
lib.mkIf config.applications.files.qbittorrent.enable {
  home.packages = with pkgs; [
    qbittorrent
  ];
}
