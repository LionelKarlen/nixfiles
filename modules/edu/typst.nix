{
  inputs,
  ...
}:
let
  pkgs-unstable = inputs.nixpkgs-unstable.legacyPackages.x86_64-linux;
in
{
  den.aspects.edu = {
    homeManager =
      { pkgs, config, ... }:
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
  };
}
