{ inputs, ... }:
{
  den.aspects.media =
    let
      pkgs-unstable = inputs.nixpkgs-unstable.legacyPackages.x86_64-linux;
    in
    {
      homeManager =
        { pkgs, ... }:
        {
          programs.discord = {
            enable = true;
            package = pkgs-unstable.vesktop;
          };
        };
    };
}
