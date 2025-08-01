{
  config,
  pkgs,
  ...
}: {
  imports = [
    # ./rofi.nix
    ./waybar.nix
  ];

  home.packages = [
    pkgs.xwayland
    pkgs.swww
    pkgs.networkmanagerapplet
    pkgs.kdePackages.breeze
    pkgs.pavucontrol
  ];

  wayland.windowManager.hyprland = {
    enable = true;
    package = pkgs.hyprland;
    xwayland.enable = true;
    systemd.enable = true;

    settings = {
      monitor = [
        "DP-2,2560x1440@165,0x0,1"
        "DP-1,1920x1080,-1080x0,1,transform,3"
        "HDMI-A-1,2560x1440,2560x0,1"
      ];
      input = {
        kb_layout = "ch";
        kb_variant = "de";
        follow_mouse = 1;
        touchpad = {
          natural_scroll = "yes";
        };
      };
      general = {
        border_size = 2;
        gaps_in = 3;
        gaps_out = 2;
        layout = "dwindle";
        "col.active_border" = "0xff24acd4";
      };
      workspace = [
        "1,monitor:DP-2"
        "2,monitor:DP-2"
        "3,monitor:DP-2"
      ];
      decoration = {
        rounding = 0;
        blur.enabled = false;
      };
      animations = {
        enabled = "yes";
        bezier = "in_bezier, 0.05, 0.9, 0.1, 1.05";
        animation = [
          "windows, 1, 2, in_bezier"
          "windowsOut, 1, 2, default, popin 80%"
          "border, 1, 2, default"
          "borderangle, 1, 2, default"
          "fade, 1, 2, default"
          "workspaces, 1, 2, default"
        ];
      };
      dwindle = {
        pseudotile = "yes";
        preserve_split = "yes";
      };
      master = {
      };
      gestures = {
        workspace_swipe = "off";
      };
      misc = {
        force_default_wallpaper = 0;
      };
      "$mainMod" = "SUPER";
      bind = [
        # execution
        "$mainMod, RETURN, exec, foot"
        "$mainMod, B, exec, librewolf"
        "$mainMod SHIFT, B, exec, librewolf --private-window"
        "$mainMod, E, exec, dolphin"
        "$mainMod, SPACE, exec, rofi -show drun"
        "$mainMod, g, exec, hyprctl monitors all > /home/lionel/monitors"

        # hotkeys
        "$mainMod SHIFT, E, exit" # close hyprland
        "$mainMod, Q, killactive" # close current window
        "$mainMod, T, togglefloating" # toggle the current window as floating
        "$mainMod, U, togglesplit" # toggle vertical or horizontal splitting
        "$mainMod, P, pseudo," # pseudo
        "$mainMod, F, fullscreen, 0"

        # focus
        "$mainMod, h, movefocus, l"
        "$mainMod, l, movefocus, r"
        "$mainMod, k, movefocus, u"
        "$mainMod, j, movefocus, d"
        "$mainMod SHIFT, h, movewindow, l"
        "$mainMod SHIFT, l, movewindow, r"
        "$mainMod SHIFT, k, movewindow, u"
        "$mainMod SHIFT, j, movewindow, d"

        # workspaces
        "$mainMod, 1, workspace, 1"
        "$mainMod, 2, workspace, 2"
        "$mainMod, 3, workspace, 3"
        "$mainMod, 4, workspace, 4"
        "$mainMod, 5, workspace, 5"
        "$mainMod, 6, workspace, 6"
        "$mainMod, 7, workspace, 7"
        "$mainMod, 8, workspace, 8"
        "$mainMod, 9, workspace, 9"
        "$mainMod, O, workspace, name:O"
        "$mainMod, Y, workspace, name:Y"

        "$mainMod SHIFT, 1, movetoworkspace, 1"
        "$mainMod SHIFT, 2, movetoworkspace, 2"
        "$mainMod SHIFT, 3, movetoworkspace, 3"
        "$mainMod SHIFT, 4, movetoworkspace, 4"
        "$mainMod SHIFT, 5, movetoworkspace, 5"
        "$mainMod SHIFT, 6, movetoworkspace, 6"
        "$mainMod SHIFT, 7, movetoworkspace, 7"
        "$mainMod SHIFT, 8, movetoworkspace, 8"
        "$mainMod SHIFT, 9, movetoworkspace, 9"
        "$mainMod SHIFT, O, movetoworkspace, name:O"
        "$mainMod SHIFT, Y, movetoworkspace, name:Y"

        # scratchpad
        "$mainMod, S, togglespecialworkspace, magic"
        "$mainMod SHIFT, S, movetoworkspace, special:magic"
      ];
      exec-once = [
        # "hyprctl setcursor Breeze_Light 24"
        # "bash ~/.taiga/features/hyprland_autostart.sh"
      ];
    };
  };
}
