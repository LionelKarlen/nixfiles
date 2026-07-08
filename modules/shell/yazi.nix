{
  den.aspects.shell = {
    homeManager =
      {
        pkgs,
        lib,
        config,
        ...
      }:
      let
        yazi-plugins = pkgs.stdenv.mkDerivation {
          name = "yazi-plugins";
          src = pkgs.fetchFromGitHub {
            owner = "yazi-rs";
            repo = "plugins";
            rev = "8cd50c622898d3ace3ca821f540241965308289a";
            hash = "sha256-f4y952sUF/lrHMX6enQts/obk2DeatqAcaVHfjTD65k=";
          };
          installPhase = ''
            mkdir -p $out/smart-enter.yazi
            cp smart-enter.yazi/* $out/smart-enter.yazi/
            cp $out/smart-enter.yazi/main.lua $out/smart-enter.yazi/init.lua

            mkdir -p $out/no-status.yazi
            cp no-status.yazi/* $out/no-status.yazi/
            cp $out/no-status.yazi/main.lua $out/no-status.yazi/init.lua

            mkdir -p $out/full-border.yazi
            cp full-border.yazi/* $out/full-border.yazi/
            cp $out/full-border.yazi/main.lua $out/full-border.yazi/init.lua
          '';
        };
      in
      {
        programs.yazi = {
          enable = true;
          shellWrapperName = "y";
          plugins = {
            smart-enter = "${yazi-plugins}/smart-enter.yazi";
            no-status = "${yazi-plugins}/no-status.yazi";
            full-border = "${yazi-plugins}/full-border.yazi";
          };
          settings = {
            manager = {
              show_hidden = true;
            };
          };
          initLua = ''
            require("no-status"):setup()
            require("full-border"):setup()
          '';
          keymap = {
            mgr.prepend_keymap = [
              {
                on = "<Enter>";
                run = "plugin smart-enter";
                desc = "";
              }
              {
                on = "l";
                run = "plugin smart-enter";
                desc = "";
              }
              {
                on = "<Esc>";
                run = "quit";
                desc = "";
              }
            ];
          };
        };
      };
  };

}
