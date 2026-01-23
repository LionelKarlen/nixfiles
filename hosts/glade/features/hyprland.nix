{
  pkgs,
  pkgs-unstable,
  lib,
  config,
  ...
}:
{
  imports = [
    ./waybar.nix
  ];

  home.packages =
    (with pkgs; [
      xwayland
      networkmanagerapplet
      kdePackages.breeze
      pavucontrol
      hyprshot
      wl-clipboard
    ])
    ++ (with pkgs-unstable; [
      swww
    ]);

  wayland.windowManager.hyprland = {
    enable = true;
    package = pkgs.hyprland;
    xwayland.enable = true;
    systemd.enable = true;

    settings = {
      monitor = [
        "DP-2,2560x1440@165,0x0,1"
        "DP-1,2560x1440,2560x0,1"
      ];
      input = {
        sensitivity = -0.75;
        kb_layout = "ch";
        kb_variant = "de";
        follow_mouse = 1;
        touchpad = {
          natural_scroll = "yes";
        };
      };
      general = {
        border_size = 2;
        gaps_in = 5;
        gaps_out = 10;
        allow_tearing = true;
        layout = "dwindle";
        "col.active_border" = lib.mkForce ''rgb(424153)'';
      };
      workspace = [
        "1,monitor:DP-2"
        "2,monitor:DP-2"
        "3,monitor:DP-2"
      ];
      decoration = {
        rounding = 0;
        blur.enabled = false;
        shadow.enabled = false;
      };
      animations = {
        enabled = "yes";
        bezier = [
          "in_bezier, 0.05, 0.9, 0.1, 1.05"
          "inout_bezier, 0.65, 0, 0.35, 1"
        ];
        animation = [
          "windows, 1, 2, in_bezier"
          "windowsOut, 1, 2, default, popin 80%"
          "border, 1, 2, default"
          "borderangle, 1, 2, default"
          "fade, 1, 2, default"
          "workspaces, 1, 2, inout_bezier"
          "specialWorkspace,1,2,default,slidefadevert -50%"
        ];
      };
      dwindle = {
        pseudotile = "yes";
        preserve_split = "yes";
      };
      master = {
      };
      cursor = {
        no_hardware_cursors = true;
        enable_hyprcursor = false;
      };
      misc = {
        force_default_wallpaper = 0;
      };
      "$mainMod" = "SUPER";
      bind = [
        # execution
        "$mainMod, RETURN, exec, ghostty"
        "$mainMod SHIFT, COMMA, exec, ghostty"
        "$mainMod SHIFT, B, exec, zen --private-window"
        "$mainMod, B, exec, zen"
        "$mainMod, E, exec, dolphin"
        "$mainMod, SPACE, exec, rofi -show drun"
        "$mainMod, R, exec, rofi -show drun"
        "$mainMod, Z, exec, hyprshot -m region --clipboard-only"

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

        "$mainMod SHIFT, 1, movetoworkspace, 1"
        "$mainMod SHIFT, 2, movetoworkspace, 2"
        "$mainMod SHIFT, 3, movetoworkspace, 3"
        "$mainMod SHIFT, 4, movetoworkspace, 4"
        "$mainMod SHIFT, 5, movetoworkspace, 5"
        "$mainMod SHIFT, 6, movetoworkspace, 6"
        "$mainMod SHIFT, 7, movetoworkspace, 7"
        "$mainMod SHIFT, 8, movetoworkspace, 8"
        "$mainMod SHIFT, 9, movetoworkspace, 9"

        "$mainMod, I, togglespecialworkspace, I"
        "$mainMod, O, togglespecialworkspace, O"
        "$mainMod, D, togglespecialworkspace, D"
        "$mainMod, Y, togglespecialworkspace, Y"

        "$mainMod SHIFT, O, movetoworkspace, special:O"
        "$mainMod SHIFT, I, movetoworkspace, special:I"
        "$mainMod SHIFT, D, movetoworkspace, special:D"
        "$mainMod SHIFT, Y, movetoworkspace, special:Y"

        # scratchpad
        "$mainMod, S, togglespecialworkspace, magic"
        "$mainMod SHIFT, S, movetoworkspace, special:magic"
      ];
      exec-once = [
        "hyprctl setcursor Bibita-Modern-Ice 24"
        "bash ~/.nixfiles/hosts/glade/features/files/hyprland_startup.sh"
        "xrandr --output DP-2 --primary"
        "hyprctl dispatch workspace 1"
      ];
    };
  };
}
