{
  config,
  lib,
  pkgs,
  ...
}: {
  home.packages = with pkgs; [
    zathura
    freetube
    protonvpn-cli_2
    librewolf
    tor-browser
  ];
}
