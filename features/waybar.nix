{
  config,
  pkgs,
  lib,
  ...
}: {
  programs.waybar = {
    enable = true;
    style = ''

          ${builtins.readFile "${pkgs.waybar}/etc/xdg/waybar/style.css"}
            window#waybar {
              border-bottom: none;
              background: #242424
            }

            * {
              font-size: 12px;
      	background: transparent;
            }
            button {
          border: none;
          border-radius: 0;
      }

      button:hover {
          transition-duration: .1s;
          background: inherit;
      }

      #workspaces button {
      color: white;
      }

      #clock, #pulseaudio, #tray, #battery, #network {
      background: transparent;
      color: white;
      }
      #pulseaudio.muted {
      background: transparent;
      }


      #workspaces button.active {
      color: #24acd4;
      }

    '';
    settings = [
      {
        height = 20;
        layer = "top";
        position = "top";
        tray = {spacing = 10;};
        modules-center = ["clock"];
        modules-left = ["hyprland/workspaces"];
        modules-right = [
          "tray"
          "battery"
          "pulseaudio"
        ];
        battery = {
          format = "{capacity}% {icon}";
          format-alt = "{time} {icon}";
          format-charging = "{capacity}% ";
          format-icons = ["" "" "" "" ""];
          format-plugged = "{capacity}% ";
          states = {
            critical = 15;
            warning = 30;
          };
        };
        clock = {
          format = "{:%d-%m-%Y %H:%M}";
          tooltip-format = "{:%Y-%m-%d | %H:%M}";
        };
        cpu = {
          format = "{usage}% ";
          tooltip = false;
        };
        memory = {format = "{}% ";};
        network = {
          interval = 1;
          format-alt = "{ifname}: {ipaddr}/{cidr}";
          format-disconnected = "Disconnected ⚠";
          format-ethernet = "{ifname}: {ipaddr}/{cidr}   up: {bandwidthUpBits} down: {bandwidthDownBits}";
          format-linked = "{ifname} (No IP) ";
          format-wifi = "";
        };
        pulseaudio = {
          format = "{volume}% {icon}";
          format-bluetooth = "{volume}% {icon}";
          format-bluetooth-muted = " {icon}";
          format-icons = {
            car = "";
            default = ["" "" ""];
            handsfree = "";
            headphones = "";
            headset = "";
            phone = "";
            portable = "";
          };
          format-muted = " (muted)";
          format-source = "{volume}% ";
          format-source-muted = "";
          on-click = "pavucontrol";
        };
        "sway/mode" = {format = ''<span style="italic">{}</span>'';};
        temperature = {
          critical-threshold = 80;
          format = "{temperatureC}°C {icon}";
          format-icons = ["" "" ""];
        };
      }
    ];
  };
}
