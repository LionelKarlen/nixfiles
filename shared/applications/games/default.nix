{ lib, ... }:
{
  imports = [
    ./prism.nix
    ./steam.nix
  ];
  options.applications.games = {
    steam.enable = lib.mkEnableOption "enable steam";
    prism.enable = lib.mkEnableOption "enable prismlauncher (minecraft)";
  };
}
