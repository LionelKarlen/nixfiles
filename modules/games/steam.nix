{ den, ... }:
{
  den.aspects.games = {
    includes = [
      (den.batteries.unfree [
        "steam"
        "steam-unwrapped"
      ])
    ];
    nixos = {
      programs.steam = {
        enable = true;
      };
    };
  };
}
