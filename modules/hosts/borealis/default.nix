{
  den,
  inputs,
  ...
}:
{
  flake-file.inputs = {
    disko = {
      url = "github:nix-community/disko";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };
  den.hosts.x86_64-linux.borealis.users.lionel = { };

  den.aspects.alan = {
    provides.borealis = {
      includes = with den.aspects; [
        base
        vcs
        vpn
        shell
      ];
    };
  };
  den.homes.x86_64-linux."alan@borealis" = { };

  den.aspects.borealis = {
    includes = [
      den.batteries.hostname
    ]
    ++ (with den.aspects; [
      base
      ssh
    ]);

    provides.to-users = {
      includes = with den.aspects; [
        base
      ];
    };

    nixos =
      { pkgs, modulesPath, ... }:
      {
        imports = [
          inputs.disko.nixosModules.disko
          (modulesPath + "/profiles/qemu-guest.nix")
          ./_disk-config.nix
        ];

        boot.loader = {
          systemd-boot.enable = true;
          efi.canTouchEfiVariables = true;
        };
        environment.systemPackages = [ pkgs.hello ];

        systemd.extraConfig = ''
          DefaultStartLimitIntervalSec=30s
            DefaultStartLimitBurst=30s'';

        services.openssh = {
          enable = true;
          ports = [ 505 ];
          settings = {
            PermitRootLogin = "no";
            PasswordAuthentication = false;
          };
        };
        users.users.root.openssh.authorizedKeys.keys = [
          "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIFCsUAbZ4fhMtYJL2b710Db6n8+Sj4PyTQ4L7/JVW1yL lionel@tundra"
        ];
      };
  };

}
