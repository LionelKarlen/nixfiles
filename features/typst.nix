{
  pkgs,
  pkgs-unstable,
  config,
  ...
}: let
  elk-utils_version = "0.1.0";
  elk-utils = pkgs.fetchFromGitHub {
    owner = "lionelkarlen";
    repo = "elk-utils";
    rev = "5023eeb3f94339c26aff64805922fa651ef06625";
    hash = "sha256-xU9VucbkL3KBiEECTiGG2B6rk3wq5RL2ngLpZy9Azms=";
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
