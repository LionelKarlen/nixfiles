{
  stdenv,
  fetchYarnDeps,
  fetchFromGithub,
  pkgs,
  yarnConfigHook,
  yarnBuildHook,
  lib,
  ...
}:

stdenv.mkDerivation (finalAttrs: {
  name = "icb-pickems";
  version = "0.1.0";

  src = fetchFromGithub {
    owner = "LionelKarlen";
    repo = "icb-pickems";
    rev = "8c02a8d7685cdd6e8d3cde666357060f4e5244e0";
    hash = lib.fakeHash;
  };

  nativeBuildInputs = with pkgs; [
    nodejs
    yarn
    yarnConfigHook
    yarnBuildHook
  ];

  yarnOfflineCache = fetchYarnDeps {
    yarnLock = "${finalAttrs.src}/yarn.lock";
    hash = "sha256-WB4gkA85xFKfvloo/nx2+HfghN3fus+p85UckNXmRhw=";
  };

  installPhase = ''
    runHook preInstall
    mkdir -p $out/pb_migrations
    cp -r pb_migrations/* $out/pb_migrations
    mkdir -p $out/public
    cp -r dist $out/pb_public
  '';
})
