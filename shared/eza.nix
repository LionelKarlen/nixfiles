{
  lib,
  config,
  pkgs,
  ...
}:
{
  options = {
    eza.enable = lib.mkEnableOption "enable eza";
  };
  config = lib.mkIf config.eza.enable {
    home.packages = with pkgs; [
      eza
    ];
    programs.zsh.shellAliases = {
      ls = "eza";
    };
  };
}
