{
  lib,
  fetchFromGitHub,
  rustPlatform,
}:

rustPlatform.buildRustPackage (finalAttrs: rec {
  pname = "quoin";
  version = "1.0.0";

  src = fetchFromGitHub {
    owner = "LionelKarlen";
    repo = "quoin";
    tag = "v${version}";
    hash = "sha256-Q6YN0tHt3/p4xK2uQ8FYG78Njj68AaJKO5AWsFzW9LI=";
  };

  cargoHash = "sha256-tZuzobuaIQRX58MTQImEO0LrTI6RLSON1Xf/mHZ/9mE=";
})
