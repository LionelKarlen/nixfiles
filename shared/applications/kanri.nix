{
  lib,
  config,
  pkgs,
  ...
}:
lib.mkIf config.applications.kanri.enable {
  nixpkgs.overlays = [
    (final: prev: {
      kanri = prev.callPackage ../../packages/kanri/kanri.nix { };
    })
  ];
  home.packages = [ pkgs.kanri ];
}
