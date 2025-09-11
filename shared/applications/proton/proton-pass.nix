{
  lib,
  config,
  pkgs,
  ...
}:
lib.mkIf config.applications.proton.pass.enable {
  home.packages = with pkgs; [ proton-pass ];
}
