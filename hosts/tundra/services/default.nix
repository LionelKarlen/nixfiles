{ ... }:
{
  imports = [
    ../../../shared/services/default.nix
    ./jellyfin.nix
  ];

  shared_services = {
    caddy = {
      enable = true;
    };
    tailscale = {
      enable = true;
    };
  };

}
