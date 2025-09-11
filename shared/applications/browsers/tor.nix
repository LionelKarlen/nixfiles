{
  lib,
  config,
  pkgs,
  ...
}:
lib.mkIf config.applications.browsers.tor.enable {
  home.packages = with pkgs; [
    tor-browser
  ];
}
