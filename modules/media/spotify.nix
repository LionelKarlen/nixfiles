{ inputs, den, ... }:
{

  flake-file.inputs = {
    spicetify-nix.url = "github:Gerg-L/spicetify-nix";
  };

  den.aspects.media = {
    includes = [ (den.batteries.unfree [ "spotify" ]) ];
    homeManager = {
      imports = [ inputs.spicetify-nix.homeManagerModules.spicetify ];
      programs.spicetify.enable = true;
    };
  };
}
