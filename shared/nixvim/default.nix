{
  lib,
  config,
  pkgs-unstable,
  ...
}:
{
  imports = [
    ./autocmd.nix
    ./plugins.nix
    ./options.nix
    ./keymaps.nix
  ];

  options = {
    nixvim = {
      enable = lib.mkEnableOption "enable nixvim";
      defaultEditor = lib.mkOption {
        type = lib.types.bool;
        default = false;
        description = "Make Nixvim the default editor";
      };
    };
  };

  config = lib.mkIf config.nixvim.enable {
    programs.nixvim = {
      enable = true;
      defaultEditor = config.nixvim.defaultEditor;
      nixpkgs.pkgs = pkgs-unstable;
    };
  };
}
