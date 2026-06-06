{
  lib,
  fetchFromGitHub,
  rustPlatform,
}:

rustPlatform.buildRustPackage (finalAttrs: rec {
  pname = "maudfmt";
  version = "0.1.8";

  src = fetchFromGitHub {
    owner = "Jeosas";
    repo = "maudfmt";
    tag = "v${version}";
    hash = "sha256-2FQzDnr+LzzlOdIpeyEZQuKAqnMhY5B23qEbEMeVHLY=";
  };

  # skip tests, because rustfmt will not be available during build
  doCheck = false;
  cargoHash = "sha256-O4qm+WDorxz7ZJuSuJkepaIkYuMn0bZCtBwuuAkYQ0U=";
})
