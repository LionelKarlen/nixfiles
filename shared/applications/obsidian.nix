{
  pkgs,
  config,
  lib,
  ...
}:
lib.mkIf config.applications.obsidian.enable {
  home.packages = with pkgs; [
    obsidian
  ];
}
