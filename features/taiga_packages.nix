{
  config,
  lib,
  pkgs,
  ...
}: {
  home.packages = with pkgs; [
    openssl
    pkg-config
    openssl.dev
  ];
}
