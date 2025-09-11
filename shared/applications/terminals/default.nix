{ lib, ... }:
{
  imports = [
    ./foot.nix
    ./kitty.nix
    ./ghostty.nix
  ];

  options.applications.terminals = {
    foot.enable = lib.mkEnableOption "enable foot";
    kitty.enable = lib.mkEnableOption "enable kitty";
    ghostty.enable = lib.mkEnableOption "enable ghostty";
  };
}
