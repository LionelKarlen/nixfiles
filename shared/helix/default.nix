{
  lib,
  config,
  ...
}:
{
  imports = [
    ./options.nix
    ./editor.nix
    ./keymap.nix
    ./lsp.nix
    ./plugins.nix
  ];
  options = {
    helix = {
      enable = lib.mkEnableOption "enable helix";
      defaultEditor = lib.mkOption {
        type = lib.types.bool;
        default = false;
        description = "Make Helix the default editor";
      };
    };
  };
  config = lib.mkIf config.helix.enable {
    programs.helix = {
      enable = true;
      defaultEditor = config.helix.defaultEditor;
    };
  };
}
