{
  lib,
  config,
  pkgs,
  ...
}:
lib.mkIf config.applications.browsers.chromium.enable {
  home.packages = with pkgs; [
    ungoogled-chromium
  ];
}
