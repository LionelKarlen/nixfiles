{ lib, ... }:
{
  imports = [
    ../../shared/default.nix
  ];

  helix.enable = true;
  yazi.enable = true;
  nixvim.enable = false;


}
