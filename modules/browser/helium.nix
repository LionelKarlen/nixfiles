{ inputs, ... }:
{
  flake-file.inputs = {
    helium = {
      url = "github:schembriaiden/helium-browser-nix-flake";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  den.aspects.browser = {
    homeManager = { pkgs, ... }: {
      home.packages = [
        inputs.helium.packages.${pkgs.stdenv.hostPlatform.system}.default
      ];
    };
  };
}
