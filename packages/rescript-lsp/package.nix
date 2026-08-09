{
  lib,
  pkgs,
  fetchFromGitHub,
  ocamlPackages,
  buildNpmPackage,
}:
let
  version = "1.74.0";
  rescript-analysis = ocamlPackages.buildDunePackage rec {
    pname = "analysis";
    inherit version;

    minimalOCamlVersion = "4.04";

    src = pkgs.fetchFromGitHub {
      owner = "rescript-lang";
      repo = "rescript-vscode";
      rev = version;
      hash = "sha256-NIWCxS6Mar7c7l+pdnm+G4U8KEsUsr9pnNaEuvABcvk=";
    };

    nativeBuildInputs = [ ocamlPackages.cppo ];
  };
in
buildNpmPackage rec {
  pname = "rescript-language-server";
  inherit version;

  src = fetchFromGitHub {
    owner = "rescript-lang";
    repo = "rescript-vscode";
    rev = version;
    hash = "sha256-NIWCxS6Mar7c7l+pdnm+G4U8KEsUsr9pnNaEuvABcvk=";
  };

  patches = [
    ./shared.patch
  ];

  prePatch = ''
    cd "$NIX_BUILD_TOP/${src.name}/shared"
    chmod -R u+w .
  '';
  postPatch = ''
    cd "$NIX_BUILD_TOP/${src.name}/server"
  '';

  sourceRoot = "${src.name}/server";
  npmDepsHash = "sha256-Qsq0jCxdNdlpEiGzuB/JcTEfZ6DJ7bIbHv65JozjW70=";

  nativeBuildInputs = [ pkgs.esbuild ];
  buildPhase = ''
    cd "$NIX_BUILD_TOP/${src.name}/server"
    npm install
    mkdir analysis_binaries/linux
    cp ${rescript-analysis}/bin/rescript-editor-analysis analysis_binaries/linux/rescript-editor-analysis.exe
    esbuild src/cli.ts --bundle --sourcemap --outfile=out/cli.js --format=cjs --platform=node --loader:.node=file --minify
  '';
}
