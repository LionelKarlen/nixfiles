{ lib, ... }:
{
  imports = [
    ./firefox.nix
    ./brave.nix
    ./tor.nix
    ./zen.nix
    ./librewolf.nix
  ];

  options.applications.browsers = {
    firefox.enable = lib.mkEnableOption "enable firefox";
    brave.enable = lib.mkEnableOption "enable brave";
    tor.enable = lib.mkEnableOption "enable tor";
    zen.enable = lib.mkEnableOption "enable zen";
    librewolf.enable = lib.mkEnableOption "enable librewolf";
  };
}
