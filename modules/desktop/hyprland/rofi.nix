{
  den.aspects.hyprland = {
    homeManager =
      {
        pkgs,
        ...
      }:
      {

        programs.rofi = {
          enable = true;
          package = pkgs.rofi;
        };
      };
  };
}
