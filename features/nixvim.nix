{
  lib,
  config,
  pkgs-unstable,
  ...
}: {
  imports = [
    ./nixvim/autocmd.nix
    ./nixvim/plugins.nix
    ./nixvim/options.nix
    ./nixvim/keymaps.nix
  ];

  programs.nixvim = {
    enable = true;
    defaultEditor = true;
    nixpkgs.pkgs = pkgs-unstable;
  };
}
