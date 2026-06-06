{
  den.aspects.gnome = {
    nixos = {
      services.xserver.displayManager.gdm.enable = true;
      services.xserver.desktopManager.gnome.enable = true;
      services.xserver.enable = true;
      services.xserver.displayManager.gdm.wayland = true;
    };
  };
}
