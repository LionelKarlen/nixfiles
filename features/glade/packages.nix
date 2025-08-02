{
  pkgs,
  pkgs-unstable,
  roc_pkgs,
  ...
}: {
  home.packages =
    (with pkgs; [
      ripgrep
      unzip
      wget
      curl
      rustup
      pdftk
      zip
      fzf
      fd
    ])
    ++ (with pkgs-unstable; [
      just
      super-productivity
    ])
    ++ (with roc_pkgs; [
      full
    ]);
}
