{ lib, ... }:
{
  imports = [
    ./vikunja.nix
    ./caddy.nix
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
  };
}
