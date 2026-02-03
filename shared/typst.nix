{
  lib,
  pkgs,
  pkgs-unstable,
  config,
  ...
}:
let
  elk-utils_version = "2.0.1";
  elk-utils = pkgs.fetchFromGitHub {
    owner = "lionelkarlen";
    repo = "elk-utils";
    tag = "v${elk-utils_version}";
    hash = "sha256-imnEvfLoKpWGRd1HufZ+oaKU7lOTJOnClyYiMhZDbR0=";
  };
in
{
  options = {
    typst.enable = lib.mkEnableOption "enable typst";
  };
  config = lib.mkIf config.typst.enable {
    home.packages =
      (with pkgs-unstable; [
        typst
        typst-live
        tinymist
      ])
      ++ [ elk-utils ];

    xdg.dataFile."typst/packages/local/elk-utils/${elk-utils_version}".source =
      config.lib.file.mkOutOfStoreSymlink "${elk-utils}";
  };
}
