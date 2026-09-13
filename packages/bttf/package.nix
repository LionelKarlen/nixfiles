{
  lib,
  fetchFromGitHub,
  rustPlatform,
}:

# https://github.com/BurntSushi/bttf/releases/tag/0.1.4
rustPlatform.buildRustPackage (finalAttrs: rec {
  pname = "bttf";
  version = "0.1.4";

  src = fetchFromGitHub {
    owner = "BurntSushi";
    repo = "bttf";
    rev = "${version}";
    hash = "sha256-KB9ix/4UTNoxXAT+EuCtcjjFKurwPYrYBcx4H2ctv/E=";
  };

  cargoHash = "sha256-afmzxV+rN2Cw1cQltsml4Z6NsP3E5FEf/VY9RRWE+uc=";
})
