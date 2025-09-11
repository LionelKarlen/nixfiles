{ lib, ... }:
{
  imports = [
    ./proton-pass.nix
    ./proton-vpn.nix
  ];

  options.applications.proton = {
    pass.enable = lib.mkEnableOption "enable proton pass";
    vpn.enable = lib.mkEnableOption "enable proton vpn";
  };
}
