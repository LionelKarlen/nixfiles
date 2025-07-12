{
  pkgs,
  pkgs-unstable,
  config,
  ...
}: let
  elk-utils_version = "1.0.0";
  elk-utils = pkgs.fetchFromGitHub {
    owner = "lionelkarlen";
    repo = "elk-utils";
    rev = "448e34dccdb4372947972951e224954efbdbdc7d";
    hash = "sha256-nu7RNssMcrVDuYzjYspa2iePVogyuteGimtmIaVWnEw=";
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
