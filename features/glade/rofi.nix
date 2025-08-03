{
  config,
  pkgs,
  ...
}: {
  stylix.targets.rofi.enable = false;

  programs.rofi = {
    enable = true;
    package = pkgs.rofi-wayland;
    theme = with config.lib.stylix.colors.withHashtag;
      builtins.toFile "theme.rasi" (''
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
        + builtins.readFile ./files/rofi.rasi);
  };
}
