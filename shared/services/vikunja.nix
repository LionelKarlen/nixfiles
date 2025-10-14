{ lib, config, ... }:
let
  hostname = config.shared_services.vikunja.hostname;
  port = config.shared_services.vikunja.port;
in
{
  config = lib.mkIf config.shared_services.vikunja.enable (
    lib.mkMerge [
      {
        services.vikunja = {
          enable = true;
          frontendHostname = hostname;
          frontendScheme = "http";
          port = port;
          settings = {
            service = {
              enableemailreminders = false;
            };
          };
        };
      }

      (lib.mkIf config.shared_services.caddy.enable {
        services.caddy.virtualHosts.${hostname}.extraConfig =
          ''reverse_proxy http://localhost:${toString port}'';
      })

    ]
  );
}
