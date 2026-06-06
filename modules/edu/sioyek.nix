{
  den.aspects.edu = {
    homeManager =
      { pkgs, ... }:
      {
        programs.sioyek = {
          enable = true;
          package = pkgs.symlinkJoin {
            name = "sioyek";
            paths = [ pkgs.sioyek ];
            buildInputs = [ pkgs.makeWrapper ];
            postBuild = ''
              wrapProgram $out/bin/sioyek \
                --set QT_QPA_PLATFORM xcb --set XCURSOR_SIZE 24
            '';
          };
        };
      };
  };
}
