{ lib, ... }:
{
  imports = [
    ./vikunja.nix
    ./caddy.nix
  ];

  options.shared_services = {
    vikunja = {
      enable = lib.mkEnableOption "enable Vikunja";
    };
    caddy = {
      enable = lib.mkEnableOption "enable Caddy";
    };
  };
}
