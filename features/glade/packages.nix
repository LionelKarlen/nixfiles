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
      nim
      nimble
      gcc
      harper
      qmk
    ])
    ++ (with pkgs-unstable; [
      just
      super-productivity
      obs-studio
    ])
    ++ (with roc_pkgs; [
      full
    ]);
}
