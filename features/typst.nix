{
  lib,
  pkgs,
  pkgs-unstable,
  config,
  ...
}: let
  elk-utils_version = "1.1.0";
  elk-utils = pkgs.fetchFromGitHub {
    owner = "lionelkarlen";
    repo = "elk-utils";
    rev = "054acdddbfb04b36d3d1ebb6d914a7d637f64cb6";
    hash = "sha256-u4dm1MmXS4WWD8kq2b5dbJWT1ztB9qdDEPZHqIRJ0Zg";
  };
in {
  home.packages =
    (
      with pkgs-unstable; [
        typst
        typst-live
      ]
    )
    ++ [
      elk-utils
    ];

  xdg.dataFile."typst/packages/local/elk-utils/${elk-utils_version}".source = config.lib.file.mkOutOfStoreSymlink "${elk-utils}";
}
