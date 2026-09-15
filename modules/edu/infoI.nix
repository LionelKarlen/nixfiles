{ inputs, ... }:
{
  den.aspects.edu = {
    homeManager =
      { pkgs, ... }:
      {
        nixpkgs.overlays = [
          inputs.self.overlays.default
        ];
        home.packages = with pkgs; [
          jupyter
          thonny
        ];
      };
  };
}
