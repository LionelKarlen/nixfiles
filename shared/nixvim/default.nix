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
    nixvim.enable = lib.mkEnableOption "enable nixvim";
  };

  config = lib.mkIf config.nixvim.enable {
    programs.nixvim = {
      enable = true;
      defaultEditor = true;
      nixpkgs.pkgs = pkgs-unstable;
    };
  };
}
