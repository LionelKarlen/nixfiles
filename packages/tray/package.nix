{
  lib,
  fetchFromGitHub,
  rustPlatform,
}:

rustPlatform.buildRustPackage (finalAttrs: rec {
  pname = "tray";
  version = "0.0.0";

  src = fetchFromGitHub {
    owner = "lionelkarlen";
    repo = "tray";
    rev = "83ed9cc2b4f95e1cb6cf75eaa08f251db64dc07b";
    hash = "sha256-+0M3ycU6YByfi3XKdjHqOUf0OYorsm+KTvsTo6FXVeI=";
  };
  cargoHash = "sha256-+ro1okWtgbfguKc3Y8bCEL85ShmqB16uOIsLKQVnZcE=";
})
