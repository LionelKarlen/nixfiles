{
  lib,
  config,
  pkgs,
  pkgs-unstable,
  ...
}:
{
  options = {
    utilities.enable = lib.mkEnableOption "enable utilities";
  };
  config = lib.mkIf config.utilities.enable {
    home.packages =
      (with pkgs; [
        ripgrep
        unzip
        wget
        curl
        zip
        fzf
        fd
      ])
      ++ (with pkgs-unstable; [
        just
      ]);
  };
}
