{
  den,
  ...
}:
{
  den.hosts.x86_64-linux.tundra.users.lionel = { };

  den.aspects.lionel = {
    provides.tundra = {
      includes = with den.aspects; [
        base
        vcs
        vpn
        shell
      ];
    };
  };
  den.homes.x86_64-linux."lionel@tundra" = { };

  den.aspects.tundra = {
    includes = [
      den.batteries.hostname
    ]
    ++ (with den.aspects; [
      base
      ssh
      jellyfin
    ]);

    provides.to-users = {
      includes = with den.aspects; [
        base
      ];
    };

    nixos =
      { pkgs, ... }:
      {
        imports = [
          ./_hardware-configuration.nix
        ];

        boot.loader = {
          systemd-boot.enable = true;
          efi.canTouchEfiVariables = true;
        };
        networking.dhcpcd = {
          enable = true;
          extraConfig = ''
            interface wlp5s0
            metric 50

            interface enp4s0
            metric 130
          '';
        };
        networking.firewall.enable = false;
        environment.systemPackages = [ pkgs.hello ];
      };
  };

}
