{
  pkgs,
  config,
  lib,
  ...
}:
lib.mkIf config.applications.filezilla.enable {
  home.packages = with pkgs; [
    filezilla
  ];
}
