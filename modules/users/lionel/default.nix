{ den, ... }:
{

  den.aspects.lionel = {
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
    };
  };
}
