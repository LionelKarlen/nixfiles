{
  lib,
  config,
  pkgs,
  ...
}:
lib.mkIf config.programming.cpp.enable {
  home.packages = with pkgs; [
    gcc
  ];
}
