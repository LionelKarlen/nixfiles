{
  lib,
  config,
  pkgs,
  ...
}:
lib.mkIf config.applications.freetube.enable {
  programs.freetube = {
    enable = true;
    package = pkgs.callPackage ../../packages/freetube/freetube.nix { };
  };
}
