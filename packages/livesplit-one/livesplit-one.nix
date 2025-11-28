{
  lib,
  pkgs,
  fetchFromGitHub,
  rustPlatform,
}:

rustPlatform.buildRustPackage (finalAttrs: {
  pname = "livesplit-one-druid";
  version = "0.6.0";

  src = fetchFromGitHub {
    owner = "AlexKnauth";
    repo = "livesplit-one-druid";
    tag = finalAttrs.version;
    hash = "sha256-1ZZXNAnZ11vwORQu3lwZOnSMIA6SBcyKxr2/VNnxut8=";
  };

  cargoHash = "sha256-+ChJx1GjZSGSJwUtFKM1Q6i/teHHefNE2dIEFET1fPI=";
  nativeBuildInputs = with pkgs; [
    pkg-config
    wrapGAppsHook3
  ];
  buildInputs = with pkgs; [
    glib
    pango
    gtk3
  ];
})
