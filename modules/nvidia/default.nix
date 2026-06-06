{ den, ... }:
{
  den.aspects.nvidia = {
    includes = [
      (den.batteries.unfree [
        "nvidia-x11"
        "nvidia-settings"
        "nvidia-persistenced"
      ])
    ];
    nixos =
      { config, ... }:
      {
        hardware = {
          graphics = {
            enable = true;
            enable32Bit = true;
          };
          nvidia = {
            modesetting.enable = true;
            open = true;
            powerManagement.enable = false;
            powerManagement.finegrained = false;
            nvidiaSettings = true;
            package = config.boot.kernelPackages.nvidiaPackages.stable;
          };
        };

      };
  };
}
