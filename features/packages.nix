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
    ])
    ++ (with pkgs-unstable; [
      deno
    ]);
}
