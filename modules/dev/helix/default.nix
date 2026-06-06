{
  inputs,
  ...
}:
let
  pkgs-unstable = inputs.nixpkgs-unstable.legacyPackages.x86_64-linux;
in
{
  den.aspects.helix = {
    homeManager = {
      programs.helix = {
        enable = true;
        defaultEditor = true;
        package = pkgs-unstable.helix;
        settings = {
          theme = "flexoki_light";
        };
      };
    };
  };
}
