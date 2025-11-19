{ config, ... }:
{
  stylix.targets.waybar = {
    addCss = false;
  };

  programs.waybar = {
    enable = true;
    style =
      with config.lib.stylix.colors.withHashtag;
      ''
        @define-color base00 ${base00}; @define-color base01 ${base01}; @define-color base02 ${base02}; @define-color base03 ${base03};
        @define-color base04 ${base04}; @define-color base05 ${base05}; @define-color base06 ${base06}; @define-color base07 ${base07};

        @define-color base08 ${base08}; @define-color base09 ${base09}; @define-color base0A ${base0A}; @define-color base0B ${base0B};
        @define-color base0C ${base0C}; @define-color base0D ${base0D}; @define-color base0E ${base0E}; @define-color base0F ${base0F};
      ''
      + builtins.readFile ././files/waybar.css;
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
          "pulseaudio"
          "battery"
          "tray"
        ];
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
  };
}
