{ lib, config, ... }:
lib.mkIf config.shared_services.tailscale.enable {
  services.tailscale = {
    enable = true;
  };
}
