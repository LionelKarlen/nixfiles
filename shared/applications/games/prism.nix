{
  lib,
  config,
  pkgs,
  ...
}:
lib.mkIf config.applications.games.prism.enable {
  home.packages = with pkgs; [
    (prismlauncher.override {
      additionalLibs = [
        pkgs.nss
        pkgs.nspr
        pkgs.libgbm
      ];
    })
  ];
}
