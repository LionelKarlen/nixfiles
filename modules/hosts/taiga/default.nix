{
  den,
  ...
}:
{
  den.hosts.x86_64-linux.taiga.users.eepy = { };

  den.aspects.eepy = {
    provides.taiga = {
      includes = with den.aspects; [
        base
        browser
        hyprland
        desktop
        dev
        edu
        media
        pass
        terminal
        vcs
        vpn
        shell
      ];
    };
  };
  den.homes.x86_64-linux."eepy@taiga" = { };

  den.aspects.taiga = {
    includes = [
      den.batteries.hostname
    ]
    ++ (with den.aspects; [
      base
      bluetooth
      audio
      desktop
      games
      nvidia
    ]);

    provides.to-users = {
      includes = with den.aspects; [
        base
        audio
        desktop
        nvidia
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
        environment.systemPackages = [ pkgs.hello ];
      };
  };

}
