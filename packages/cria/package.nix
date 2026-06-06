{
  lib,
  fetchFromGitHub,
  rustPlatform,
}:

rustPlatform.buildRustPackage (finalAttrs: {
  pname = "cria";
  version = "0.1.0";

  src = fetchFromGitHub {
    owner = "LionelKarlen";
    repo = "cria";
    rev = "2527cb4b32b8073b3d27d90491b4f8cdccd3842c";
    hash = "sha256-XReL1ccUerx+ikFzuaYgiMMO0DAM9kpY02MZaqO/9Ic=";
  };

  cargoHash = "sha256-GxWi8ZrQXLjYv2tsxnf+obyO+OocxZdD/xwdf+hMwkI=";
})
