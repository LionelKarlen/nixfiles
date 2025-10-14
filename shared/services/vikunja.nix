{ lib, config, ... }:
lib.mkIf config.shared_services.vikunja.enable {
  services.vikunja = {
    enable = true;
    frontendHostname = "localhost";
    frontendScheme = "http";
  };
}
