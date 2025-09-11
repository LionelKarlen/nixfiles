{
  lib,
  config,
  pkgs,
  ...
}:
lib.mkIf config.programming.deno.enable {
  home.packages = with pkgs; [
    deno
  ];
}
