{
  lib,
  config,
  pkgs,
  ...
}:
lib.mkIf config.applications.files.zathura.enable {
  home.packages = with pkgs; [ zathura ];
}
