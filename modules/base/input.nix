{
  den.aspects.base = {
    nixos =
      { pkgs, lib, ... }:
      {
        services.xserver.xkb = {
          layout = "ch";
          variant = "de_nodeadkeys";
        };

        i18n.inputMethod = {
          enable = lib.mkForce false;
          type = "ibus";
        };

        console.keyMap = "sg";

        services.udev = {
          packages = with pkgs; [
            qmk-udev-rules
            vial
          ];
        };
      };
  };
}
