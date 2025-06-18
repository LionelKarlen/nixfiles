{
  pkgs,
  lib,
  ...
}: let
  zjplugin_version = "v0.20.2";
  zjstatus = pkgs.fetchurl {
    url = "https://github.com/dj95/zjstatus/releases/download/${zjplugin_version}/zjstatus.wasm";
    hash = "sha256-OSg7Q1AWKW32Y9sHWJbWOXWF1YI5mt0N4Vsa2fcvuNg=";
  };
  zellij-switch_version = "0.2.1";
  zellij-switch = pkgs.fetchurl {
    url = "https://github.com/mostafaqanbaryan/zellij-switch/releases/download/${zellij-switch_version}/zellij-switch.wasm";
    hash = "sha256-7yV+Qf/rczN+0d6tMJlC0UZj0S2PWBcPDNq1BFsKIq4=";
  };
  zelegate = import (pkgs.fetchFromGitHub {
    owner = "lionelkarlen";
    repo = "zelegate";
    rev = "c3c5af672b525eba7ca17aceb67b6f4808d40957";
    hash = "sha256-E3Rr6mlBqXSnlPibzUzQGU+HtQpehC0XxO19+y39I84=";
  }) {inherit pkgs;};
  zelewidget_cmd = "zelewidget documents documents/programming documents/school";
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
      plugins = {
        zellij-switch = {
          location = "file:${zellij-switch}";
        };
      };
      default_mode = "locked";
      default_layout = "default";
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
  home.file.".config/zellij/layouts/default.kdl".source = pkgs.substituteAll {
    src = ./simple.kdl;
    inherit zjstatus;
  };
  home.packages = [
    zelegate
  ];
  programs.bash = {
    shellAliases = {
      zlj = "zellij -l welcome";
    };
  };
  programs.zsh = {
    shellAliases = {
      zlj = "zellij -l welcome";
      z = zelewidget_cmd;
    };
    initExtra = ''
                zel() {
                  (
                    exec </dev/tty
                    exec <&1
                    ${zelewidget_cmd}
                  )
      TRAPEXIT() {
      printf '\n'
      zle .reset-prompt
          }
                }
                zle -N zel
                bindkey  "^w" zel
                # bindkey -s "^w" "(z)\n"
    '';
  };
  programs.nixvim = {
    keymaps = [
      {
        mode = "n";
        key = "<C-w>";
        action = "<cmd>!${zelewidget_cmd}<CR>";
      }
    ];
  };
}
