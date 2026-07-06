{ den, ... }:
{
  den.aspects.desktop = {
    includes = with den.aspects; [ theme ];
    nixos =
      { pkgs, ... }:
      {
        services = {
          xserver.enable = true;
          displayManager.gdm = {
            enable = true;
          };
          desktopManager.gnome.enable = true;
        };
        xdg.portal.enable = true;
        xdg.portal.extraPortals = with pkgs; [
          xdg-desktop-portal-gtk
          xdg-desktop-portal-gnome
          xdg-desktop-portal-hyprland
        ];
        xdg.portal.config.common.default = "*";
        environment.sessionVariables = {
          NIXOS_OZONE_WL = "1";
          GTK_IM_MODULE = "simple";
        };
      };
  };
}
