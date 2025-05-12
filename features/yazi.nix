{
  pkgs,
  lib,
  ...
}: let
  yazi-plugins = pkgs.stdenv.mkDerivation {
    name = "yazi-plugins";
    src = pkgs.fetchFromGitHub {
      owner = "yazi-rs";
      repo = "plugins";
      rev = "864a0210d9ba1e8eb925160c2e2a25342031d8d3";
      hash = "sha256-+KK8IylF+CvYcJe2hjs+TplRMwF2C2c+nP1s4JRhbcc=";
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
  easyjump = pkgs.fetchFromGitHub {
    owner = "mikavilpas";
    repo = "easyjump.yazi";
    rev = "a13e395a901f0c37e16879df3d774dc7d38fbf9d";
    hash = "sha256-3+0B6GRQTEmwuJduar5y/OtMLP14MTuB1XFL4dsc8/Q=";
    postFetch = ''
      ls $out
      cp $out/main.lua $out/init.lua
    '';
  };
in {
  programs.yazi = {
    enable = true;
    plugins = {
      smart-enter = "${yazi-plugins}/smart-enter.yazi";
      no-status = "${yazi-plugins}/no-status.yazi";
      full-border = "${yazi-plugins}/full-border.yazi";
      easyjump = "${easyjump}";
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
      manager.prepend_keymap = [
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
          on = "i";
          run = "plugin easyjump";
          desc = "";
        }
        {
          on = "<Esc>";
          run = "close";
          desc = "";
        }
        {
          on = ",,";
          run = "close";
          desc = "";
        }
      ];
    };
  };
}
