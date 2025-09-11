{
  lib,
  config,
  pkgs,
  ...
}:
lib.mkIf config.applications.calibre.enable {
  home.packages = with pkgs; [
    calibre
  ];
}
