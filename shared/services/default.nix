{ lib, ... }:
{
  imports = [
    ./vikunja.nix
    ./caddy.nix
    ./syncthing.nix
    ./tailscale.nix
  ];

  options.shared_services = {
    vikunja = {
      enable = lib.mkEnableOption "enable Vikunja";
      hostname = lib.mkOption {
        type = lib.types.str;
        default = "";
        description = "Vikunja hostname";
      };

      port = lib.mkOption {
        type = lib.types.port;
        default = 3456;
        description = "Vikunja port";
      };
    };
    caddy = {
      enable = lib.mkEnableOption "enable Caddy";
    };
    tailscale = {
      enable = lib.mkEnableOption "enable Tailscale";
    };
    syncthing = {
      enable = lib.mkEnableOption "enable Syncthing";
      username = lib.mkOption {
        type = lib.types.str;
        default = "lionel";
        description = "Syncthing username (primary user)";
      };
    };
  };
}
