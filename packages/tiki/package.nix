{
  buildGoModule,
  fetchFromGitHub,

}:
buildGoModule rec {
  pname = "tiki";
  version = "0.6.1";

  src = fetchFromGitHub {
    owner = "boolean-maybe";
    repo = "tiki";
    rev = "v${version}";
    hash = "sha256-uxdgB13rHwWperjuFMznUyP/70r4h2drVxSGSGFzYyM=";
  };

  vendorHash = "sha256-vV8iBVdurcMUC7kwkAlnSt6cI4gNFRg721rkSuuOC2g=";
  doCheck = false;
}
