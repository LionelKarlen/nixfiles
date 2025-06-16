{
  pkgs,
  pkgs-unstable,
  roc_pkgs,
  ...
}: {
  home.packages =
    (with pkgs; [
      ranger
      gcc
      ripgrep
      gnumake
      unzip
      nodejs_22
      yarn
      bun
      wget
      curl
      rustup
      python3
      pdftk
      zip
      lean4
      nim
    ])
    ++ (with pkgs-unstable; [
      deno
    ])
    ++ (with roc_pkgs; [
      full
    ]);
}
