{ inputs, ... }: {
  flake-file.inputs = {
    niri-scratchpad = {
      url = "github:gvolpe/niri-scratchpad";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };
  den.aspects.niri = {

    homeManager =
      { pkgs, ... }:
      {
        home.packages =
          (with pkgs; [
            kdePackages.breeze
            niri
            xwayland-satellite
          ])
          ++ [
            inputs.niri-scratchpad.packages.${pkgs.stdenv.hostPlatform.system}.default
          ];

      };
  };
}
