{
  lib,
  config,
  pkgs,
  ...
}:
lib.mkIf config.programming.zig.enable {
  home.packages = with pkgs; [
    zig
    zls
  ];
}
