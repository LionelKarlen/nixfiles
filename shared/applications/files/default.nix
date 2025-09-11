{ lib, ... }:
{
  imports = [
    ./sioyek.nix
    ./zathura.nix
    ./mpv.nix
    ./vlc.nix
    ./qbittorrent.nix
  ];
  options.applications.files = {
    sioyek.enable = lib.mkEnableOption "enable sioyek";
    zathura.enable = lib.mkEnableOption "enable zathura";
    mpv.enable = lib.mkEnableOption "enable mpv";
    vlc.enable = lib.mkEnableOption "enable vlc";
    qbittorrent.enable = lib.mkEnableOption "enable qbittorrent";
  };
}
