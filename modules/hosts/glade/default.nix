{
  den,
  ...
}:
{
  den.hosts.x86_64-linux.glade.users.lionel = { };

  den.aspects.lionel = {
    provides.glade = {
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
  den.homes.x86_64-linux."lionel@glade" = { };

  den.aspects.glade = {
    includes = [
      den.batteries.hostname
    ]
    ++ (with den.aspects; [
      base
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
