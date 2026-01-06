{ ... }:
{
  imports = [
    ../../../shared/services/default.nix
  ];

  shared_services = {
    syncthing.enable = true;
    syncthing.username = "eepy";
    tailscale.enable = true;
  };
}
