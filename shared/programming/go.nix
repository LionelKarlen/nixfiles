{
  lib,
  config,
  pkgs,
  ...
}:
lib.mkIf config.programming.go.enable {
  home.packages = with pkgs; [
    go
    gopls
  ];
}
