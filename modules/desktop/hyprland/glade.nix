{
  den.aspects.glade = {
    nixos = {
      programs.dconf.enable = true;
      programs.hyprland = {
        enable = true;
        xwayland.enable = true;
      };
    };
  };
  den.aspects.lionel = {
    provides.glade = {
      homeManager =
        {
          lib,
          config,
          ...
        }:
        {
          wayland.windowManager.hyprland = {
            settings = {
              monitor = [
                "DP-2,2560x1440@165,0x0,1"
                "DP-1,2560x1440,2560x0,1"
              ];
              general = {
                "col.active_border" = lib.mkForce "rgb(424153)";
              };
              workspace = [
                "1,monitor:DP-2"
                "2,monitor:DP-2"
                "3,monitor:DP-2"
              ];
              exec-once = [
                "hyprctl setcursor Bibita-Modern-Ice 24"
                "bash ~/.nixfiles/files/glade/startup.sh"
                "xrandr --output DP-2 --primary"
                "hyprctl dispatch workspace 1"
              ];
            };
          };

          stylix.targets.rofi.enable = false;

          programs.rofi = {
            theme =
              with config.lib.stylix.colors.withHashtag;
              builtins.toFile "theme.rasi" (
                ''
                  * {
                      font:   "Hasklug Nerd Font Medium 12";

                      bg0:     ${base01};
                      bg1:     ${base02};
                      fg0:     ${base04};

                      accent-color:     ${base0B};
                      urgent-color:     #ffffff;

                      background-color:   transparent;
                      text-color:         @fg0;

                      margin:     0;
                      padding:    0;
                      spacing:    0;
                  }
                ''
                + builtins.readFile ../../../files/rofi.rasi
              );
          };

          stylix.targets.waybar = {
            addCss = false;
          };

          programs.waybar = {
            settings = [
              {
                height = 24;
                layer = "top";
                position = "top";
                margin-top = 10;
                margin-left = 10;
                margin-right = 10;
                margin-down = 5;
                tray = {
                  spacing = 10;
                };
                modules-center = [ "clock" ];
                modules-left = [ "hyprland/workspaces" ];
                modules-right = [
                  "tray"
                  "pulseaudio"
                ];
                clock = {
                  format = "{:%d-%m-%Y %H:%M}";
                };
                pulseaudio = {
                  format = "{icon}";
                  format-icons = {
                    default = [
                      ""
                      ""
                      ""
                    ];
                  };
                  format-muted = " (muted)";
                  on-click = "pavucontrol";
                };
              }
            ];
            style =
              with config.lib.stylix.colors.withHashtag;
              ''
                @define-color base00 ${base00}; @define-color base01 ${base01}; @define-color base02 ${base02}; @define-color base03 ${base03};
                @define-color base04 ${base04}; @define-color base05 ${base05}; @define-color base06 ${base06}; @define-color base07 ${base07};

                @define-color base08 ${base08}; @define-color base09 ${base09}; @define-color base0A ${base0A}; @define-color base0B ${base0B};
                @define-color base0C ${base0C}; @define-color base0D ${base0D}; @define-color base0E ${base0E}; @define-color base0F ${base0F};
              ''
              + builtins.readFile ../../../files/waybar.css;
          };
        };
    };
  };
}
