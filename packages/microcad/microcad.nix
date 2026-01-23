{
  lib,
  pkgs,
  fetchgit,
  rustPlatform,
}:

rustPlatform.buildRustPackage (finalAttrs: {
  pname = "microcad";
  version = "v0.2.20";

  src = fetchgit {
    url = "https://codeberg.org/microcad/microcad";
    rev = finalAttrs.version;
    hash = "sha256-L38udAGgvmaDnWH2zONlBIjJQHVwuVa0v3OtJuX8Dyo=";
    fetchSubmodules = true;
  };

  cargoHash = "sha256-0dmo/PdiZ/0Tv5K2nYhg7m4WWRTkAXM9fbGNylUdsNw=";

  # wait for new release of manifold-rs / linking of static libraries in manifold-rs
  # then can install microcad once it updates
  buildPhase = ''cargo build --release'';
  nativeBuildInputs = with pkgs; [
    cmake
    ninja
  ];
})
