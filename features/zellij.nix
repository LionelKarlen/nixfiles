{pkgs, ...}: let
  zjplugin_version = "v0.20.2";
  zjstatus = pkgs.fetchurl {
    url = "https://github.com/dj95/zjstatus/releases/download/${zjplugin_version}/zjstatus.wasm";
    hash = "sha256-OSg7Q1AWKW32Y9sHWJbWOXWF1YI5mt0N4Vsa2fcvuNg=";
  };
in {
  programs.zellij = {
    enable = true;
    settings = {
      simplified_ui = true;
      pane_frames = false;
      theme = "nord";
      themes.nord = {
        fg = "#D8DEE9";
        bg = "#2E3440";
        black = "#3B4252";
        red = "#BF616A";
        green = "#A3BE8C";
        yellow = "#EBCB8B";
        blue = "#81A1C1";
        magenta = "#B48EAD";
        cyan = "#88C0D0";
        white = "#E5E9F0";
        orange = "#D08770";
      };
      ui = {
        pane_frames = {
          hide_session_name = true;
        };
      };
      default_mode = "locked";
      default_layout = "simple";
      "keybinds clear-defaults=true" = {
        shared = {
          "bind \"Ctrl o\"" = {SwitchToMode = "tmux";};
          "bind \"Alt h\"" = {MoveFocusOrTab = "Left";};
          "bind \"Alt j\"" = {MoveFocus = "Down";};
          "bind \"Alt k\"" = {MoveFocus = "Up";};
          "bind \"Alt l\"" = {MoveFocusOrTab = "Right";};
        };

        tmux = {
          "bind \"d\"" = {Detach = [];};
          "bind \"Esc\" \"Ctrl o\"" = {SwitchToMode = "locked";};
          "bind \"n\"" = {
            NewPane = "Right";
            SwitchToMode = "locked";
          };
          "bind \"u\"" = {
            NewPane = "Down";
            SwitchToMode = "locked";
          };
          "bind \"q\"" = {
            CloseFocus = [];
            SwitchToMode = "locked";
          };
          "bind \"t\"" = {
            NewTab = [];
            SwitchToMode = "locked";
          };
          "bind \"Tab\"" = {GoToNextTab = [];};
          "bind \"w\"" = {
            "LaunchOrFocusPlugin \"session-manager\"" = {
              floating = true;
              move_to_focused_tab = true;
            };
            SwitchToMode = "locked";
          };
        };
      };
    };
  };
  home.file.".config/zellij/layouts/dflt.kdl".text = ''
         layout {
         pane size=1 borderless=1 {
    plugin location="tab-bar"
         }
         pane
         }
  '';
  home.file.".config/zellij/layouts/simple.kdl".source = pkgs.substituteAll {
    src = ./simple.kdl;
    inherit zjstatus;
  };
  programs.bash = {
    shellAliases = {
      zlj = "zellij -l welcome";
    };
  };
}
