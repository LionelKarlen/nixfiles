{
  config,
  lib,
  pkgs,
  pkgs-unstable,
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
    ])
    ++ (with pkgs-unstable; [
      deno
    ]);
}
