{
  lib,
  config,
  pkgs,
  ...
}:
lib.mkIf config.applications.browsers.librewolf.enable {
  home.packages = with pkgs; [
    librewolf
  ];
}
