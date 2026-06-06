{
  den.aspects.vpn = {
    nixos = {
      services.tailscale = {
        enable = true;
      };
    };
  };
}
