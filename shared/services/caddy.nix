{ lib, config, ... }:
lib.mkIf config.shared_services.caddy.enable {
  services.caddy = {
    enable = true;

    };

}
