{
  lib,
  rustPlatform,
  fetchFromGitHub,
  fetchYarnDeps,
  cargo-tauri,
  nodejs,
  pkg-config,
  wrapGAppsHook3,
  yarn,
  yarnConfigHook,
  webkitgtk_4_1,
  libsoup_3,
}:
rustPlatform.buildRustPackage (finalAttrs: {
  pname = "kanri";
  version = "0.8.1";

  src = fetchFromGitHub {
    owner = "kanriapp";
    repo = "kanri";
    rev = "a6fc3a6beea67e8a6b5398d963f9fc1f0ad11d81";
    hash = "sha256-pP+q9AD2WATFYWHFitcrebN8y6iGCyXqmQYXCs9Ytf0=";
  };

  cargoRoot = "src-tauri";
  buildAndTestSubdir = "src-tauri";

  cargoHash = "sha256-JLv4YC40VcRMQVgJnunLkFIEfLKUTEDBgNMV6NmMAzA=";

  yarnOfflineCache = fetchYarnDeps {
    inherit (finalAttrs) src;
    hash = "sha256-z0RLQ6n3hdsaBy3BiIOpuvpPBq3ST02r7lfsGfJypb8=";
  };

  nativeBuildInputs = [
    cargo-tauri.hook
    nodejs
    pkg-config
    wrapGAppsHook3
    yarn
    yarnConfigHook
  ];

  buildInputs = [
    libsoup_3
    webkitgtk_4_1
  ];

  preBuild = ''
    yarn --offline generate
  '';

  postInstall = ''
    wrapProgram $out/bin/kanri --set WEBKIT_DISABLE_DMABUF_RENDERER 1
  '';

  checkFlags = [
    # tries to mutate the parent directory
    "--skip=test_file_operation"
  ];

  meta = with lib; {
    description = "Modern offline Kanban board app";
    homepage = "https://kanriapp.com";
    license = licenses.gpl3;
    mainProgram = "kanri";
  };
})
