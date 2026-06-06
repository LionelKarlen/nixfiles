{ den, ... }:
{
  den.aspects.base = {
    includes = with den.aspects; [
      nix
    ];

    nixos =
      { pkgs, ... }:
      {
        environment.systemPackages = with pkgs; [
          vim
          git
        ];
      };
  };
}
