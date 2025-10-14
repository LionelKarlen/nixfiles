{ lib, ... }:
{
  imports = [
    ./applications/default.nix
    ./programming/default.nix
    ./services/default.nix
    ./nixvim/default.nix
    ./helix/default.nix
    ./utilities.nix
    ./zoxide.nix
    ./yazi.nix
    ./zsh.nix
    ./tmux.nix
    ./git.nix
    ./typst.nix
    ./eza.nix
    ./jj.nix
    ./starship.nix
    ./nh.nix
  ];

  nixvim.enable = lib.mkDefault true;

  git.enable = lib.mkDefault true;
  zsh.enable = lib.mkDefault true;
  starship.enable = lib.mkDefault true;
  tmux.enable = lib.mkDefault true;

  utilities.enable = lib.mkDefault true;
}
