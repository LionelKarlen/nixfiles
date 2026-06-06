{
  den.aspects.taiga = {
    nixos = {
      programs.dconf.enable = true;
      programs.hyprland = {
        enable = true;
        xwayland.enable = true;
      };
    };
  };
  den.aspects.eepy = {
    provides.taiga = {

      homeManager =
        {
          lib,
          pkgs,
          config,
          ...
        }:
        {
          wayland.windowManager.hyprland = {
            settings = {
              monitor = [
              ];
              general = {
                "col.active_border" = lib.mkForce "rgb(${config.lib.stylix.colors.base0B})";
              };
              exec-once = [
                "hyprctl setcursor Bibita-Modern-Ice 24"
                "bash ~/.nixfiles/files/taiga/startup.sh"
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
                margin-top = 0;
                margin-left = 0;
                margin-right = 0;
                margin-down = 5;
                tray = {
                  spacing = 10;
                };
                modules-center = [ "clock" ];
                modules-left = [ "hyprland/workspaces" ];
                modules-right = [
                  "tray"
                  "battery"
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
                battery = {
                  format = "{capacity}% {icon}";
                  format-alt = "{time} {icon}";
                  format-charging = "{capacity}% ";
                  format-icons = [
                    ""
                    ""
                    ""
                    ""
                    ""
                  ];
                  format-plugged = "{capacity}% ";
                  states = {
                    critical = 15;
                    warning = 30;
                  };
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
