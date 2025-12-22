{ lib, config, ... }:
let
  username = config.shared_services.syncthing.username;
in
lib.mkIf config.shared_services.syncthing.enable {
  services.syncthing = {
    enable = true;
    user = username;
    dataDir = "/home/${username}";
    configDir = "/home/${username}/.config/syncthing";
  };
}
