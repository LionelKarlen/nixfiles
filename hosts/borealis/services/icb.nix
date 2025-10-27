{
  lib,
  config,
  pkgs,
  ...
}:
let
  icb-pickems = pkgs.callPackage "../../../packages/icb-pickems/icb-pickems.nix";
in
{

  systemd.services.icb = {
    script = "${pkgs.pocketbase}/bin/pocketbase serve --dir /var/icb --migrationsDir ${icb-pickems}/pb_migrations --publicDir ${icb-pickems}/pb_public";
    serviceConfig = {
      LimitNOFILE = 4096;
    };
    wantedBy = [ "multi-user.target" ];
  };

  services.caddy.virtualHosts."icb".extraConfig = ''reverse_proxy http://localhost:8090'';
}
