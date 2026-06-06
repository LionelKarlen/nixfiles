{ den, ... }:
{
  den.aspects.alan = {
    includes = [
      den.batteries.define-user
      den.batteries.primary-user
      den.aspects.base
      (den.batteries.user-shell "zsh")
    ];
    user = {
      extraGroups = [
        "networkmanager"
        "wheel"
      ];
      openssh.authorizedKeys.keys = [
        "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIFCsUAbZ4fhMtYJL2b710Db6n8+Sj4PyTQ4L7/JVW1yL lionel@tundra"
      ];
    };
  };
}
