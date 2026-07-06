{ inputs, ... }:
{
  flake-file.inputs = {
    stylix = {
      url = "github:nix-community/stylix/release-26.05";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };
  den.aspects.theme = {
    homeManager = {
      imports = [
        inputs.stylix.homeModules.stylix
      ];

      fonts.fontconfig.enable = true;

      stylix = {
        enable = true;
        targets = {
          helix.enable = false;
          yazi.enable = false;
          firefox.enable = false;
          zen-browser.enable = false;
        };
      };
    };
  };
}
