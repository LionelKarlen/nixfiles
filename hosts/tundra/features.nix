{lib, ...}: {
  imports = [
    ../../shared/default.nix
  ];

  zoxide.enable = true;
  helix.enable = true;
  helix.defaultEditor = true;
  yazi.enable = true;
  typst.enable = true;
  eza.enable = true;
  jj.enable = true;
}
