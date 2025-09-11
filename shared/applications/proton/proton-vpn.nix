{
  lib,
  config,
  pkgs,
  ...
}:
lib.mkIf config.applications.proton.vpn.enable {
  home.packages = with pkgs; [ protonvpn-gui ];
}
