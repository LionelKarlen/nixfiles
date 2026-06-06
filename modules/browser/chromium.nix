{
  den.aspects.browser = {
    homeManager =
      { pkgs, ... }:
      {
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
      };
  };
}
