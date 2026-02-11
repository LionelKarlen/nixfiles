{
  lib,
  config,
  pkgs,
  ...
}:
lib.mkIf config.programming.dart.enable {
  home.packages = with pkgs; [
    dart
  ];
}
