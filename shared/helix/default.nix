{ lib, config, ... }:
{
  imports = [
    ./options.nix
    ./editor.nix
    ./keymap.nix
    ./lsp.nix
    ./plugins.nix
  ];
  options = {
    helix.enable = lib.mkEnableOption "enable helix";
  };
  config = lib.mkIf config.helix.enable {
    programs.helix = {
      enable = true;
    };
  };
}
