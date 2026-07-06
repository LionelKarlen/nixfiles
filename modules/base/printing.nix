{
  den.aspects.base = {
    nixos =
      { pkgs, ... }:
      {
        services = {
          printing.enable = true;
          avahi = {
            enable = false;
            nssmdns4 = true;
            openFirewall = true;
          };
        };
        environment.systemPackages = with pkgs; [
          vim
        ];
      };
  };
}
