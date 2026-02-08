{
  lib,
  config,
  pkgs,
  ...
}:
lib.mkIf config.applications.browsers.chromium.enable {
  home.packages = with pkgs; [
    (symlinkJoin {
      name = "chromium";
      paths = [ ungoogled-chromium ];
      buildInputs = [ makeWrapper ];
      postBuild = ''
        wrapProgram $out/bin/chromium --add-flags "--disable-gpu"
      '';
    })
  ];
}
